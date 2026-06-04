#!/usr/bin/env pwsh
#
# Copyright (c) 2018-2026 Stéphane Micheloud
#
# Licensed under the MIT License.
#

## only for interactive debugging !
$DEBUG = $false

#########################################################################
## Environment setup

$EXITCODE = 0

$EXE = ""
if ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) {
  # Fix case when both the Windows and Linux builds of this program
  # are installed in the same directory.
  $EXE = '.exe'
}

$BASENAME = (Get-Item $PSScriptRoot).Basename
$ROOT_DIR = $PSScriptRoot
$PATH_SEP = [IO.Path]::PathSeparator
$SEP = [IO.Path]::DirectorySeparatorChar

$SOURCE_DIR = $ROOT_DIR + $SEP + 'src'
$SOURCE_MAIN_DIR = $SOURCE_DIR + $SEP + 'main' + $SEP + 'ada'
$TARGET_DIR = $ROOT_DIR + $SEP + 'target'
## path must match property `Documentation_Dir` in gpr file
$TARGET_HTML_DIR = $TARGET_DIR + $SEP + 'html'
$TARGET_OBJ_DIR = $TARGET_DIR + $SEP + 'obj'

## required for gnatdoc
if (! (Test-Path -PathType Leaf -Path ($ROOT_DIR + $SEP + 'build.gpr'))) {
    Write-Error "GNAT Ada project file not found"
    $EXITCODE = 1
    Cleanup $EXITCODE
}
if (! (Test-Path -PathType Leaf -Path ($Env:GNAT_HOME + $SEP + 'bin' + $SEP + 'gnatmake' + $EXE))) {
    Write-Error "GNAT installation not found ($Env:GNAT_HOME)"
    $EXITCODE = 1
    Cleanup $EXITCODE
}
$GNATMAKE_CMD = $Env:GNAT_HOME + $SEP + 'bin' + $SEP + 'gnatmake' + $EXE
$GNATDOC_CMD = $Env:GNAT_HOME + $SEP + 'bin' + $SEP + 'gnatdoc' + $EXE

$MSYS_GNATMAKE_CMD = $Env:MSYS_HOME + $SEP + 'mingw64' + $SEP + 'bin' + $SEP + 'gnatmake' + $EXE
if (! (Test-Path -PathType Leaf -Path $MSYS_GNATMAKE_CMD)) {
    $MSYS_GNATMAKE_CMD = $null
}
$ADACTL_CMD = ($Env:ADACTL_HOME + $SEP + 'adactl' + $EXE)
if (! (Test-Path -PathType Leaf -Path $ADACTL_CMD)) {
    $ADACTL_CMD = $null
}
$DIFF_CMD = ($Env:GIT_HOME + $SEP + 'usr' + $SEP + 'bin' + $SEP + 'diff' + $EXE)
if (! (Test-Path -PathType Leaf -Path $DIFF_CMD)) {
    $DIFF_CMD = $null
}

#########################################################################
## Script arguments

$COMMANDS = @()

## Possible values: SilentlyContinue, Stop, Continue, Inquire, Ignore, Suspend
$DebugPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'
$WarningPreference = 'Continue'

$MSYS = $false
$TIMER = $false
$VERBOSE = $false
$N = 0
foreach ($ARG in $args) {
    if ($ARG.StartsWith("-")) {
        ## option
        if ($ARG -ieq "-debug") { $DEBUG = $true; $DebugPreference='Continue'
        } elseif ($ARG -ieq "-help"   ) { $COMMANDS = 'Print-Help'
        } elseif ($ARG -ieq "-msys"   ) { $MSYS = $true
        } elseif ($ARG -ieq "-timer"  ) { $TIMER = $true
        } elseif ($ARG -ieq "-verbose") { $VERBOSE = $true; $VerbosePreference = 'Continue'
        } else {
            Write-Error "Unknown option ""$ARG"""
            $EXITCODE = 1
            break
        }
    } else {
        ## subcommand
        if ($ARG -ieq "clean") { $COMMANDS += 'Clean'
        } elseif ($ARG -ieq "compile") { $COMMANDS += 'Compile'
        } elseif ($ARG -ieq "doc" ) { $COMMANDS += 'Compile', 'Doc'
        } elseif ($ARG -ieq "help") { $COMMANDS = 'Print-Help'
        } elseif ($ARG -ieq "lint") { $COMMANDS += 'Lint'
        } elseif ($ARG -ieq "run" ) { $COMMANDS += 'Compile', 'Run'
        } elseif ($ARG -ieq "test") { $COMMANDS += 'Compile', 'Test'
        } else {
            Write-Error "Unknown subcommand ""$ARG"""
            $EXITCODE = 1
            break
        }
        $N++
    }
}
$MAIN_NAME = 'gmain'
$MAIN_ARGS = $null

$SOURCE_MAIN_FILE = $SOURCE_MAIN_DIR + $SEP + $MAIN_NAME + '.adb'
$PROJECT_NAME = $BASENAME
$EXE_FILE = $TARGET_DIR + $SEP + $PROJECT_NAME + $EXE

if ($MSYS -and ! (Test-Path -PathType Leaf -Path $MSYS_GNATMAKE_CMD)) {
    Write-Warning "MSYS GNAT Make not found; use standard GNAT Make instead"
    $MSYS = $false
}
if ($COMMANDS -contains 'Lint') {
    if (! (Test-Path -PathType Leaf -Path ($Env:GNAT2019_HOME + $SEP + 'bin' + $SEP + 'gnat' + $EXE))) {
        Write-Warning "GNAT 2019 is required to execute AdaControl"
        $COMMANDS = $COMMANDS.Replace('Lint', '')
    } else {
        $PARENT_DIR = Split-Path -Parent $ROOT_DIR
        $ARU_FILE = (Get-ChildItem $PARENT_DIR -Filter *.aru) | Select-Object -First 1 -ExpandProperty FullName
        if (! (Test-Path -PathType Leaf -Path $ARU_FILE)) {
            Write-Warning "ARU file not found"
            $COMMANDS = $COMMANDS.Replace('Lint', '')
        }
    }
}
if ($COMMANDS -contains 'Compile' -and $MSYS -and ! $MSYS_GNATMAKE_CMD) {
    Write-Warning "MSYS GNAT Make not found; use standard GNAT Make instead"
    $MSYS = $false
}
Write-Debug "Options    : DEBUG=$DEBUG TIMER=$TIMER VERBOSE=$VERBOSE"
Write-Debug "Subcommands: $COMMANDS"
Write-Debug "Variables  : ""ADACTL_HOME=$Env:ADACTL_HOME"""
Write-Debug "Variables  : ""GIT_HOME=$Env:GIT_HOME"""
Write-Debug "Variables  : ""GNAT_HOME=$Env:GNAT_HOME"""
Write-Debug "Variables  : ""GNAT2019_HOME=$Env:GNAT2019_HOME"""
if ($Env:MSYS_HOME) { Write-Debug "Variables  : ""MSYS_HOME=$Env:MSYS_HOME""" }
Write-Debug "Variables  : MAIN_NAME=$MAIN_NAME MAIN_ARGS=$MAIN_ARGS"
Write-Debug "Variables  : PROJECT_NAME=$PROJECT_NAME"

if ($TIMER) { $TIMER_START = Get-Date }

#########################################################################
## Subroutines

function Main
{
    foreach($COMMAND in $COMMANDS) {
        &$COMMAND
        if ($EXITCODE -ne 0) { exit $EXITCODE }
    }
    if ($TIMER) {
        $DURATION = New-TimeSpan -Start $TIMER_START -End (Get-Date)
        Write-Output "Total execution time: $DURATION"
    }
    Cleanup $EXITCODE
}

function Print-Help
{
    Write-Output "Usage: $BASENAME { <option> | <subcommand> }"
    Write-Output ""
    Write-Output "   Options:"
    Write-Output "     -debug      print commands executed by this script"
    Write-Output "     -msys       use MSYS GNAT Make if available"
    Write-Output "     -timer      print total execution time"
    Write-Output "     -verbose    print progress messages"
    Write-Output ""
    Write-Output "   Subcommands:"
    Write-Output "     clean       delete generated files"
    Write-Output "     compile     compile Ada source files"
    Write-Output "     doc         generate HTML documentation"
    Write-Output "     help        print this help message"
    Write-Output "     lint        analyze Ada source files with AdaControl"
    Write-Output "     run         execute main program ""$MAIN_NAME"""
    Write-Output "     test        execute unit tests with AUnit"
}

function Clean
{
    Delete-Dir $TARGET_DIR
}

function Delete-Dir
{
    param (
        [string] $dir
    )
    if (Test-Path -PathType Container -Path $dir) {
        Write-Debug "[System.IO.Directory]::Delete('$dir', $true)"
        Write-Verbose "Delete directory ""$($dir.Replace($ROOT_DIR + $SEP, ''))"""
        #Remove-Item -Path $dir -Force -Recurse
        try {
            [System.IO.Directory]::Delete($dir, $true)
        } catch {
            Write-Error "Failed to delete directory ""$($dir.Replace($ROOT_DIR + $SEP, ''))"""
            $EXITCODE = 1
            return
        }
    }
}

function Lint
{
    if (! (Test-Path -PathType Container -Path $TARGET_DIR)) {
        $_ = New-Item -ItemType Directory -Path $TARGET_DIR
    }
    ## set "__GPR_FILE=%_ROOT_DIR%%_PROJECT_NAME%.gpr"
    $LOG_FILE = $TARGET_DIR + $SEP + 'adactl_log.txt'

    ## AdaControl requires the GNAT 2019 tool chain
    $OLD_PATH=$Env:PATH
    $Env:PATH = $Env:GNAT2019_HOME + $SEP + 'bin' + $PATH_SEP + $Env:PATH
    Write-Debug "GCC command is: $((Get-Command gcc).Path)"

    ## .adt and .ali files are generated in current directory
    Push-Location "$TARGET_DIR"
    Write-Debug "Current directory: $(Get-Location)"

    ## see https://www.adalog.fr/compo/adacontrol_ug.html#command-files-provided-with-AdaControl
    $ADACTL_VERBOSE_OPTS = $null
    if ($DEBUG -or $VERBOSE) { $ADACTL_VERBOSE_OPTS = '-v' }
    Write-Debug """$ADACTL_CMD"" -d $ADACTL_VERBOSE_OPTS -f ""$ARU_FILE"" -o ""$LOG_FILE"" -w ""$SOURCE_MAIN_DIR\*"""
    Write-Verbose "Analyze Ada source files"

    &"$ADACTL_CMD" -d $ADACTL_VERBOSE_OPTS -f "$ARU_FILE" -o "$LOG_FILE" -w "$SOURCE_MAIN_DIR\*"
    if ($LASTEXITCODE -eq 0) {
        if ($DEBUG -or $VERBOSE) {
            Write-Debug "type $LOG_FILE%"
            type "$LOG_FILE"
        }
        Pop-Location
        $Env:PATH = $OLD_PATH
        Write-Debug "Current directory: $(Get-Location)"
        $EXITCODE = 1
        return
    }
    Pop-Location
    $Env:PATH = $OLD_PATH
    Write-Debug "GCC command is: $((Get-Command gcc).Path)"
}

function Compile
{
    if (! (Test-Path -PathType Container -Path $TARGET_OBJ_DIR)) {
        $_ = New-Item -ItemType Directory -Path $TARGET_OBJ_DIR
    }
    $N = (Get-ChildItem -Path "$SOURCE_MAIN_DIR" -Include "*.ad?" -Recurse).Count
    if ($N -eq 0) {
        Write-Warning "No Ada source file found"
        return
    } elseif ($N -eq 1) { $N_FILES = "$N Ada source file"
    } else { $N_FILES = "$N Ada source files"
    }
    if ($MSYS) { $GNATMAKE_CMD1 = $MSYS_GNATMAKE_CMD
    } else { $GNATMAKE_CMD1 = $GNATMAKE_CMD
    }
    ## -we : Treat all warnings as errors
    $GNATMAKE_OPTS = "-gnat2022 -we -I""$SOURCE_MAIN_DIR"" -D ""$TARGET_OBJ_DIR"" -o ""$EXE_FILE"""
    if ($DEBUG) { $VERBOSE_OPTS = '-d'
    } else { $VERBOSE_OPTS = '-q'
    }
    Write-Debug """$GNATMAKE_CMD1"" $VERBOSE_OPTS $GNATMAKE_OPTS ""$SOURCE_MAIN_FILE"""
    Write-Verbose "Compile $N_FILES to directory ""$($TARGET_OBJ_DIR.Replace($ROOT_DIR + $SEP, ''))"""
    &"$GNATMAKE_CMD1" $VERBOSE_OPTS -gnat2022 -we -I"$SOURCE_MAIN_DIR" -D "$TARGET_OBJ_DIR" -o "$EXE_FILE" $SOURCE_MAIN_FILE
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to compile $N_FILES to directory ""$($TARGET_OBJ_DIR.Replace($ROOT_DIR +$SEP, ''))"""
        $EXITCODE = 1
        return
    }
}

function Doc
{
    if (! (Test-Path -PathType Container -Path $TARGET_HTML_DIR)) {
        $_ = New-Item -ItemType Directory -Path $TARGET_HTML_DIR
    }
    $JS_FILE = $TARGET_HTML_DIR + $SEP + 'index.js'
    $PROJECT_FILE = $ROOT_DIR + $SEP + 'build.gpr'

    ## https://docs.adacore.com/live/wave/gps/html/gnatdoc-doc/gnatdoc.html
    ## Options: -p=Process private part of packages
    $GNATDOC_OPTS = "-d -p --project=""$PROJECT_FILE"" --output=html"
    if ($DEBUG) { $VERBOSE_OPTS = '-d'
    } else { $VERBOSE_OPTS = '-q'
    }
    Write-Debug """$GNATDOC_CMD"" $GNATDOC_OPTS"
    Write-Verbose "Generate HTML documentation into directory ""$($TARGET_HTML_DIR.Replace($ROOT_DIR + $SEP, ''))"""
    &$GNATDOC_CMD $VERBOSE_OPTS -p --project="$PROJECT_FILE" --output=html
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to generate HTML documentation into directory ""$($TARGET_HTML_DIR.Replace($ROOT_DIR, ''))"""
        EXITCODE = 1
        return
    }
}

function Run
{
    if (! (Test-Path -PathType Leaf -Path $EXE_FILE)) {
        Write-Error "Main program ""$PROJECT_NAME"" not found ($EXE_FILE)"
        $EXITCODE = 1
        return
    }
    Write-Debug """$EXE_FILE"" $MAIN_ARGS"
    Write-Verbose "Execute Ada program ""$($EXE_FILE.Replace($ROOT_DIR + $SEP, ''))"""
    &$EXE_FILE $MAIN_ARGS
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to execute Ada program ""$($EXE_FILE.Replace($ROOT_DIR, ''))"""
        $EXITCODE = 1
        return
    }
}

function Compile-Test
{
    Write-Warning "Subcommand 'Compile-Test' is not yet implemented"
}

function Test
{
    Write-Warning "Subcommand 'Test' is not yet implemented"
}

function Cleanup
{
    param (
        [int] $ExitCode
    )
    Write-Debug "ExitCode=$ExitCode"
    exit $ExitCode
}

#########################################################################
## Entry-point

Main
