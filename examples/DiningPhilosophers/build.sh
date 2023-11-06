#!/usr/bin/env bash
#
# Copyright (c) 2018-2023 Stéphane Micheloud
#
# Licensed under the MIT License.
#

##############################################################################
## Subroutines

getHome() {
    local source="${BASH_SOURCE[0]}"
    while [[ -h "$source" ]]; do
        local linked="$(readlink "$source")"
        local dir="$( cd -P $(dirname "$source") && cd -P $(dirname "$linked") && pwd )"
        source="$dir/$(basename "$linked")"
    done
    ( cd -P "$(dirname "$source")" && pwd )
}

debug() {
    local DEBUG_LABEL="[46m[DEBUG][0m"
    $DEBUG && echo "$DEBUG_LABEL $1" 1>&2
}

warning() {
    local WARNING_LABEL="[46m[WARNING][0m"
    echo "$WARNING_LABEL $1" 1>&2
}

error() {
    local ERROR_LABEL="[91mError:[0m"
    echo "$ERROR_LABEL $1" 1>&2
}

# use variables EXITCODE, TIMER_START
cleanup() {
    [[ $1 =~ ^[0-1]$ ]] && EXITCODE=$1

    if $TIMER; then
        local TIMER_END=$(date +'%s')
        local duration=$((TIMER_END - TIMER_START))
        echo "Total execution time: $(date -d @$duration +'%H:%M:%S')" 1>&2
    fi
    debug "EXITCODE=$EXITCODE"
    exit $EXITCODE
}

args() {
    [[ $# -eq 0 ]] && HELP=true && return 1

    for arg in "$@"; do
        case "$arg" in
        ## options
        -debug)       DEBUG=true ;;
        -help)        HELP=true ;;
        -msys)        MSYS=true ;;
        -timer)       TIMER=true ;;
        -verbose)     VERBOSE=true ;;
        -*)
            error "Unknown option \"$arg\""
            EXITCODE=1 && return 0
            ;;
        ## subcommands
        clean)   CLEAN=true ;;
        compile) COMPILE=true ;;
        help)    HELP=true ;;
        lint)    LINT=true ;;
        run)     COMPILE=true && RUN=true ;;
        test)    COMPILE=true && TEST=true ;;
        *)
            error "Unknown subcommand \"$arg\""
            EXITCODE=1 && return 0
            ;;
        esac
    done
    debug "Options    : TIMER=$TIMER VERBOSE=$VERBOSE"
    debug "Subcommands: CLEAN=$CLEAN COMPILE=$COMPILE HELP=$HELP LINT=$LINT RUN=$RUN"
    debug "Variables  : ADACTL_HOME=$ADACTL_HOME"
    debug "Variables  : GIT_HOME=$GIT_HOME"
    debug "Variables  : GNAT_HOME=$GNAT_HOME"
    debug "Variables  : GNAT2019_HOME=$GNAT2019_HOME"
    debug "Variables  : MSYS_HOME=$MSYS_HOME"
    debug "Variables  : MAIN_NAME=$MAIN_NAME MAIN_ARGS=$MAIN_ARGS"
    # See http://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
    $TIMER && TIMER_START=$(date +"%s")
}

help() {
    cat << EOS
Usage: $BASENAME { <option> | <subcommand> }

  Options:
    -debug       print commands executed by this script
    -msys        use MSYS GNAT Make if available
    -timer       print total execution time
    -verbose     print progress messages

  Subcommands:
    clean        delete generated files
    compile      compile Ada source files
    doc          generate HTML documentation
    help         print this help message
    lint         analyze Ada source files with AdaControl
    run          execute the generated executable "$MAIN_NAME"
    test         execute unit tests with AUnit
EOS
}

clean() {
    if [[ -d "$TARGET_DIR" ]]; then
        if $DEBUG; then
            debug "Delete directory $TARGET_DIR"
        elif $VERBOSE; then
            echo "Delete directory \"${TARGET_DIR/$ROOT_DIR\//}\"" 1>&2
        fi
        rm -rf "$TARGET_DIR"
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
}

lint() {
    [[ -d "$TARGET_DIR" ]] || mkdir -p "$TARGET_DIR"

    local parent_dir="$(dirname $ROOT_DIR)"
    local aru_file=
    for f in $(find "$parent_dir/" -type f -name "*.aru" 2>/dev/null); do
        aru_file="$f"
    done
    if [[ ! -f "$aru_file" ]]; then
        warning "ARU file not found" 1>&2
        return 0
    fi
    local log_file="$TARGET_DIR/adactl_log.txt"

    ## see https://www.adalog.fr/compo/adacontrol_ug.html#command-files-provided-with-AdaControl
    local adactl_opts="-r -f \"$aru_file\" -o \"$log_file\" -w"
    if $DEBUG; then adactl_opts="-d $adactl_opts"
    elif $VERBOSE; then adactl_opts="-v $adactl_opts"
    fi
    if $DEBUG; then
        debug "$ADACTL_CMD $adactl_opts \"$SOURCE_DIR/*.adb\"" 1>&2
    elif $VERBOSE; then
        echo "Analyze Ada source files in directory \"${SOURCE_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    local path="$PATH"
    PATH="$GNAT2019_HOME/bin:$PATH"
    cd "$TARGET_DIR"
    eval "\"$ADACTL_CMD\" $adactl_opts \"$SOURCE_DIR/*.adb\""
    if [[ $? -ne 0 ]]; then
        if $DEBUG; then
            cat "$log_file"
        elif $VERBOSE; then
            cat "$log_file"
        fi
        cd "$ROOT_DIR"
        PATH="$path"
        error "Failed to analyze Ada source files in directory \"${SOURCE_DIR/$ROOT_DIR\//}\"" 1>&2
        cleanup 1
    fi
    cd "$ROOT_DIR"
    PATH="$path"
}

compile() {
    [[ -d "$TARGET_OBJ_DIR" ]] || mkdir -p "$TARGET_OBJ_DIR"

    local source_files=
    local n=0
    for f in $(find "$SOURCE_MAIN_DIR/" -type f -name "*.ad?" 2>/dev/null); do
        source_files="$source_files \"$f\""
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Ada source file found"
        return 1
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Ada source file$s"

    local gnatmake_cmd="$GNATMAKE_CMD"
    $MSYS && gnatmake_cmd="$MSYS_GNATMAKE_CMD"
 
    source_files="$SOURCE_MAIN_DIR/$MAIN_NAME.adb"
    ## -we : Treat all warnings as errors
    local gnatmake_opts="-gnat2022 -we -D \"$TARGET_OBJ_DIR\" -o \"$TARGET_FILE\""
    $DEBUG && gnatmake_opts="-d $gnatmake_opts"

    if $DEBUG; then
        debug "\"$gnatmake_cmd\" $gnatmake_opts $source_files"
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${TARGET_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "\"$gnatmake_cmd\" $gnatmake_opts $source_files"
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${TARGET_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

mixed_path() {
    if [[ -x "$CYGPATH_CMD" ]]; then
        $CYGPATH_CMD -am "$*"
    elif $mingw || $msys; then
        echo "$*" | sed 's|/|\\\\|g'
    else
        echo "$*"
    fi
}

doc() {
    [[ -d "$TARGET_OBJ_DIR" ]] || mkdir -p "$TARGET_OBJ_DIR"
    [[ -d "$TARGET_DIR/html" ]] || mkdir -p "$TARGET_DIR/html"

    ## https://docs.adacore.com/live/wave/gps/html/gnatdoc-doc/gnatdoc.html
    ## Options: -p=Process private part of packages
    local gnatdoc_opts="-d -p \"--project=%_ROOT_DIR%build.gpr\" --output=html"

    if $DEBUG; then
        debug "\"$GNATDOC_CMD\" $gnatdoc_opts"
    elif $VERBOSE; then
        echo "Generate HTML documentation" 1>&2
    fi
    eval "\*$GNATDOC_CMD\" $gnatdoc_opts"
    if [[ $? -ne 0 ]]; then
        error "Failed to generate HTML documentation into directory \"${TARGET_DIR/$ROOT_DIR\//}/html\""
        cleanup 1
    fi
}

dump() {
    echo "dump"
}

run() {
    if [[ ! -f "$TARGET_FILE" ]]; then
        error "Executable \"${TARGET_FILE/$ROOT_DIR\//}\" not found"
        cleanup 1
    fi
    if $DEBUG; then
        debug "$TARGET_FILE"
    elif $VERBOSE; then
        echo "Execute \"${TARGET_FILE/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$TARGET_FILE"
    if [[ $? -ne 0 ]]; then
        error "Failed to execute \"${TARGET_FILE/$ROOT_DIR\//}\"" 1>&2
        cleanup 1
    fi
}

##############################################################################
## Environment setup

BASENAME=$(basename "${BASH_SOURCE[0]}")

EXITCODE=0

ROOT_DIR="$(getHome)"

SOURCE_DIR="$ROOT_DIR/src"
SOURCE_MAIN_DIR="$SOURCE_DIR/main/ada"
TARGET_DIR="$ROOT_DIR/target"
TARGET_OBJ_DIR="$TARGET_DIR/obj"

CLEAN=false
COMPILE=false
DEBUG=false
HELP=false
LINT=false
MSYS=false
RUN=false
TIMER=false
VERBOSE=false

COLOR_START="[32m"
COLOR_END="[0m"

cygwin=false
mingw=false
msys=false
darwin=false
case "$(uname -s)" in
    CYGWIN*) cygwin=true ;;
    MINGW*)  mingw=true ;;
    MSYS*)   msys=true ;;
    Darwin*) darwin=true      
esac
unset CYGPATH_CMD
unset TARGET_EXT
PSEP=":"
if $cygwin || $mingw || $msys; then
    CYGPATH_CMD="$(which cygpath 2>/dev/null)"
    TARGET_EXT=".exe"
	PSEP=";"
    ADACTL_CMD="$(mixed_path $ADACTL_HOME)/adactl.exe"
    GNATMAKE_CMD="$(mixed_path $GNAT_HOME)/bin/gnatmake.exe"
    MSYS_GNATMAKE_CMD="$(mixed_path $MSYS_HOME)/mingw64/bin/gnatmake.exe"
else
    ADACTL_CMD=adactl
    GNATMAKE_CMD=gnatmake
    MSYS_GNATMAKE_CMD=gnatmake
fi

PROJECT_NAME="$(basename $ROOT_DIR)"
TARGET_FILE="$TARGET_DIR/$PROJECT_NAME$TARGET_EXT"

MAIN_NAME=Test_Dining_Philosophers
MAIN_ARGS=

if $LINT && [[ ! -f "$GNAT2019_HOME/bin/gnat.exe" ]]; then
    warning "GNAT 2019 is required to execute AdaControl" 1>&2
    LINT=false
fi
if [[ ! -f "$ROOT_DIR/build.gpr" ]]; then
    error "GNAT Ada project file not found" 1>&2
    cleanup 1
fi
if [[ ! -x "$GNATMAKE_CMD" ]]; then
    error "GNAT installation not found" 1>&2
    cleanup 1
fi

args "$@"
[[ $EXITCODE -eq 0 ]] || cleanup 1

##############################################################################
## Main

$HELP && help && cleanup

if $CLEAN; then
    clean || cleanup 1
fi
if $LINT; then
    lint || cleanup 1
fi
if $COMPILE; then
    compile || cleanup 1
fi
if $RUN; then
    run || cleanup 1
fi
cleanup
