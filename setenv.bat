@echo off
setlocal enabledelayedexpansion

@rem only for interactive debugging
set _DEBUG=0

@rem #########################################################################
@rem ## Environment setup

set _EXITCODE=0

call :env
if not %_EXITCODE%==0 goto end

call :args %*
if not %_EXITCODE%==0 goto end

@rem #########################################################################
@rem ## Main

if %_HELP%==1 (
    call :help
    exit /b !_EXITCODE!
)

set _GIT_PATH=
set _GNAT_PATH=
set _MSYS_PATH=
set _VSCODE_PATH=

call :adactl
if not %_EXITCODE%==0 (
    @rem optional
    set _EXITCODE=0
) else (
    @rem needed to run AdaControl
    call :gnat2019
    if not !_EXITCODE!==0 (
        @rem optional
        set _EXITCODE=0
    )
)
call :git
if not %_EXITCODE%==0 goto end
goto end
call :gnat
if not %_EXITCODE%==0 goto end

call :gwindows
if not %_EXITCODE%==0 goto end

@rem needed to build AUnit
call :msys
if not %_EXITCODE%==0 goto end

call :vscode
if not %_EXITCODE%==0 (
    @rem optional
    echo %_WARNING_LABEL% VS Code installation not found 1>&2
    set _EXITCODE=0
)
goto end

@rem #########################################################################
@rem ## Subroutines

@rem output parameters: _DEBUG_LABEL, _ERROR_LABEL, _WARNING_LABEL
:env
set _BASENAME=%~n0
set "_ROOT_DIR=%~dp0"

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:
goto :eof

:env_colors
@rem ANSI colors in standard Windows 10 shell
@rem see https://gist.github.com/mlocati/#file-win10colors-cmd

@rem normal foreground colors
set _NORMAL_FG_BLACK=[30m
set _NORMAL_FG_RED=[31m
set _NORMAL_FG_GREEN=[32m
set _NORMAL_FG_YELLOW=[33m
set _NORMAL_FG_BLUE=[34m
set _NORMAL_FG_MAGENTA=[35m
set _NORMAL_FG_CYAN=[36m
set _NORMAL_FG_WHITE=[37m

@rem normal background colors
set _NORMAL_BG_BLACK=[40m
set _NORMAL_BG_RED=[41m
set _NORMAL_BG_GREEN=[42m
set _NORMAL_BG_YELLOW=[43m
set _NORMAL_BG_BLUE=[44m
set _NORMAL_BG_MAGENTA=[45m
set _NORMAL_BG_CYAN=[46m
set _NORMAL_BG_WHITE=[47m

@rem strong foreground colors
set _STRONG_FG_BLACK=[90m
set _STRONG_FG_RED=[91m
set _STRONG_FG_GREEN=[92m
set _STRONG_FG_YELLOW=[93m
set _STRONG_FG_BLUE=[94m
set _STRONG_FG_MAGENTA=[95m
set _STRONG_FG_CYAN=[96m
set _STRONG_FG_WHITE=[97m

@rem strong background colors
set _STRONG_BG_BLACK=[100m
set _STRONG_BG_RED=[101m
set _STRONG_BG_GREEN=[102m
set _STRONG_BG_YELLOW=[103m
set _STRONG_BG_BLUE=[104m

@rem we define _RESET in last position to avoid crazy console output with type command
set _BOLD=[1m
set _UNDERSCORE=[4m
set _INVERSE=[7m
set _RESET=[0m
goto :eof

@rem input parameter: %*
@rem output parameters: _BASH, _HELP, _VERBOSE
:args
set _BASH=0
set _HELP=0
set _BASH=0
set _VERBOSE=0
:args_loop
set "__ARG=%~1"
if not defined __ARG goto args_done

if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-bash" ( set _BASH=1
    ) else if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-help" ( set _HELP=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
) else (
    @rem subcommand
    if "%__ARG%"=="help" ( set _HELP=1
    ) else (
        echo %_ERROR_LABEL% Unknown subcommand "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
)
shift
goto args_loop
:args_done
call :drive_name "%_ROOT_DIR%"
if not %_EXITCODE%==0 goto :eof
if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Options    : _BASH=%_BASH% _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: _HELP=%_HELP% 1>&2
    echo %_DEBUG_LABEL% Variables  : _DRIVE_NAME=%_DRIVE_NAME% 1>&2
)
goto :eof

@rem input parameter: %1: path to be substituted
@rem output parameter: _DRIVE_NAME (2 characters: letter + ':')
:drive_name
set "__GIVEN_PATH=%~1"
@rem remove trailing path separator if present
if "%__GIVEN_PATH:~-1,1%"=="\" set "__GIVEN_PATH=%__GIVEN_PATH:~0,-1%"

@rem https://serverfault.com/questions/62578/how-to-get-a-list-of-drive-letters-on-a-system-through-a-windows-shell-bat-cmd
set __DRIVE_NAMES=F:G:H:I:J:K:L:M:N:O:P:Q:R:S:T:U:V:W:X:Y:Z:
for /f %%i in ('wmic logicaldisk get deviceid ^| findstr :') do (
    set "__DRIVE_NAMES=!__DRIVE_NAMES:%%i=!"
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% __DRIVE_NAMES=%__DRIVE_NAMES% ^(WMIC^) 1>&2
if not defined __DRIVE_NAMES (
    echo %_ERROR_LABEL% No more free drive name 1>&2
    set _EXITCODE=1
    goto :eof
)
for /f "tokens=1,2,*" %%f in ('subst') do (
    set "__SUBST_DRIVE=%%f"
    set "__SUBST_DRIVE=!__SUBST_DRIVE:~0,2!"
    set "__SUBST_PATH=%%h"
    if "!__SUBST_DRIVE!"=="!__GIVEN_PATH:~0,2!" (
        set _DRIVE_NAME=!__SUBST_DRIVE:~0,2!
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% Select drive !_DRIVE_NAME! for which a substitution already exists 1>&2
        ) else if %_VERBOSE%==1 ( echo Select drive !_DRIVE_NAME! for which a substitution already exists 1>&2
        )
        goto :eof
    ) else if "!__SUBST_PATH!"=="!__GIVEN_PATH!" (
        set "_DRIVE_NAME=!__SUBST_DRIVE!"
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% Select drive !_DRIVE_NAME! for which a substitution already exists 1>&2
        ) else if %_VERBOSE%==1 ( echo Select drive !_DRIVE_NAME! for which a substitution already exists 1>&2
        )
        goto :eof
    )
)
for /f "tokens=1,2,*" %%i in ('subst') do (
    set __USED=%%i
    call :drive_names "!__USED:~0,2!"
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% __DRIVE_NAMES=%__DRIVE_NAMES% ^(SUBST^) 1>&2

set "_DRIVE_NAME=!__DRIVE_NAMES:~0,2!"
if /i "%_DRIVE_NAME%"=="%__GIVEN_PATH:~0,2%" goto :eof

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% subst "%_DRIVE_NAME%" "%__GIVEN_PATH%" 1>&2
) else if %_VERBOSE%==1 ( echo Assign drive %_DRIVE_NAME% to path "!__GIVEN_PATH:%USERPROFILE%=%%USERPROFILE%%!" 1>&2
)
subst "%_DRIVE_NAME%" "%__GIVEN_PATH%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to assign drive %_DRIVE_NAME% to path "!__GIVEN_PATH:%USERPROFILE%=%%USERPROFILE%%!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem input parameter: %1=Used drive name
@rem output parameter: __DRIVE_NAMES
:drive_names
set "__USED_NAME=%~1"
set "__DRIVE_NAMES=!__DRIVE_NAMES:%__USED_NAME%=!"
goto :eof

:help
if %_VERBOSE%==1 (
    set __BEG_P=%_STRONG_FG_CYAN%
    set __BEG_O=%_STRONG_FG_GREEN%
    set __BEG_N=%_NORMAL_FG_YELLOW%
    set __END=%_RESET%
) else (
    set __BEG_P=
    set __BEG_O=
    set __BEG_N=
    set __END=
)
echo Usage: %__BEG_O%%_BASENAME% { ^<option^> ^| ^<subcommand^> }%__END%
echo.
echo   %__BEG_P%Options:%__END%
echo     %__BEG_O%-bash%__END%       start Git bash shell instead of Windows command prompt
echo     %__BEG_O%-debug%__END%      print commands executed by this script
echo     %__BEG_O%-verbose%__END%    print progress messages
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%help%__END%        print this help message
goto :eof

@rem output parameter: _ADACTL_HOME
:adactl
set _ADACTL_HOME=

set __ADACTL_CMD=
for /f "delims=" %%f in ('where adactl.exe 2^>NUL') do set "__ADACTL_CMD=%%f"
if defined __ADACTK_CMD (
    for /f "delims=" %%i in ("%__ADACTL_CMD%") do set "_ADACTL_HOME=%%f"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of AdaControl executable found in PATH 1>&2
) else if defined ADACTL_HOME (
    set "_ADACTL_HOME=%ADACTL_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable ADACTL_HOME 1>&2
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\adactl\" ( set "_ADACTL_HOME=!__PATH!\adactl"
    ) else (
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\adactl*" 2^>NUL') do set "_ADACTL_HOME=!__PATH!\%%f"
        if not defined _ADACTL_HOME (
            set "__PATH=%ProgramFiles%"
            for /f "delims=" %%f in ('dir /ad /b "!__PATH!\adactl-*" 2^>NUL') do set "_ADACTL_HOME=!__PATH!\%%f"
        )
    )
    if defined _ADACTL_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default AdaControl installation directory "!_ADACTL_HOME!" 1>&2
    )
)
if not exist "%_ADACTL_HOME%\adactl.exe" (
    echo %_ERROR_LABEL% AdaControl executable not found ^("%_ADACTL_HOME%"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameters: _GNAT_HOME, _GNAT_PATH
:gnat
set _GNAT_HOME=
set _GNAT_PATH=

set _GNAT_CMD=
for /f "delims=" %%f in ('where gnat.exe 2^>NUL') do set "_GNAT_CMD=%%f"
if defined _GNAT_CMD (
    for /f "delims=" %%i in ("%_GNAT_CMD%") do set "__GNAT_BIN_DIR=%%~dpi"
    for /f "delims=" %%f in ("%__GNAT_BIN_DIR%\.") do set "_GNAT_HOME=%%~dpf"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of GNAT executable found in PATH 1>&2
    @rem keep _GNAT_PATH undefined since executable already in path
    goto :eof
) else if defined GNAT_HOME (
    set "_GNAT_HOME=%GNAT_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable GNAT_HOME 1>&2
) else (
    set __PATH=C:\opt\GNAT
    for /f "delims=" %%f in ('dir /ad /b "!__PATH!\20*" 2^>NUL') do set "_GNAT_HOME=!__PATH!\%%f"
    if not defined _GNAT_HOME (
        set "__PATH=%ProgramFiles%\GNAT"
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\20*" 2^>NUL') do set "_GNAT_HOME=!__PATH!\%%f"
    )
    if defined _GNAT_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default GNAT installation directory "!_GNAT_HOME!" 1>&2
    )
)
if not exist "%_GNAT_HOME%\bin\gnat.exe" (
    echo %_ERROR_LABEL% GNAT executable not found ^("%_GNAT_HOME%"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_GNAT_PATH=;%_GNAT_HOME%\bin"
goto :eof

@rem required to run AdaControl
@rem output parameters: _GNAT2019_HOME
:gnat2019
set _GNAT2019_HOME=

set __VERSION=2019
set __GNAT_CMD=
for /f "delims=" %%f in ('where gnat.exe 2^>NUL') do set "__GNAT_CMD=%%f"
if defined __GNAT_CMD (
    for /f "delims=" %%i in ("%__GNAT_CMD%") do set "__GNAT_BIN_DIR=%%~dpi"
    for /f "delims=" %%f in ("%__GNAT_BIN_DIR%\.") do set "_GNAT2019_HOME=%%~dpf"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of GNAT 2019 executable found in PATH 1>&2
) else if defined GNAT2019_HOME (
    set "_GNAT2019_HOME=%GNAT2019_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable GNAT2019_HOME 1>&2
) else (
    set __PATH=C:\opt\GNAT
    for /f "delims=" %%f in ('dir /ad /b "!__PATH!\%__VERSION%*" 2^>NUL') do set "_GNAT2019_HOME=!__PATH!\%%f"
    if not defined _GNAT2019_HOME (
        set "__PATH=%ProgramFiles%\GNAT"
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\%__VERSION%*" 2^>NUL') do set "_GNAT2019_HOME=!__PATH!\%%f"
    )
    if defined _GNAT2019_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default GNAT installation directory "!_GNAT_HOME!" 1>&2
    )
)
if not exist "%_GNAT2019_HOME%\bin\gnat.exe" (
    @rem echo %_ERROR_LABEL% GNAT %__VERSION% executable not found ^("%_GNAT2019_HOME%"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameters: _GIT_HOME, _GIT_PATH
:git
set _GIT_HOME=
set _GIT_PATH=

set __GIT_CMD=
for /f "delims=" %%f in ('where git.exe 2^>NUL') do set "__GIT_CMD=%%f"
if defined __GIT_CMD (
    for /f "delims=" %%i in ("%__GIT_CMD%") do set "__GIT_BIN_DIR=%%~dpi"
    for /f "delims=" %%f in ("!__GIT_BIN_DIR!..") do set "_GIT_HOME=%%f"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of Git executable found in PATH 1>&2
    @rem Executable git.exe is present both in bin\ and \mingw64\bin\
    if not "!_GIT_HOME:mingw=!"=="!_GIT_HOME!" (
        for /f "delims=" %%f in ("!_GIT_HOME!\..") do set "_GIT_HOME=%%f"
    )
    @rem keep _GIT_PATH undefined since executable already in path
    goto :eof
) else if defined GIT_HOME (
    set "_GIT_HOME=%GIT_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable GIT_HOME 1>&2
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\Git\" ( set "_GIT_HOME=!__PATH!\Git"
    ) else (
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\Git*" 2^>NUL') do set "_GIT_HOME=!__PATH!\%%f"
        if not defined _GIT_HOME (
            set "__PATH=%ProgramFiles%"
            for /f "delims=" %%f in ('dir /ad /b "!__PATH!\Git*" 2^>NUL') do set "_GIT_HOME=!__PATH!\%%f"
        )
    )
    if defined _GIT_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default Git installation directory "!_GIT_HOME!" 1>&2
    )
)
if not exist "%_GIT_HOME%\bin\git.exe" (
    echo %_ERROR_LABEL% Git executable not found ^("%_GIT_HOME%"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_GIT_PATH=;%_GIT_HOME%\bin;%_GIT_HOME%\mingw64\bin;%_GIT_HOME%\usr\bin"
goto :eof

@rem output parameter: _GWINDOWS_HOME
:gwindows
set _GWINDOWS_HOME=

if defined GWINDOWS_HOME (
    set "_GWINDOWS_HOME=%GWINDOWS_HOME%"
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\GWindows\" ( set "_GWINDOWS_HOME=!__PATH!\GWindows"
    ) else (
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\GWindows-*" 2^>NUL') do set "_GWINDOWS_HOME=!__PATH!\%%f"
        if not defined _GWINDOWS_HOME (
            set "__PATH=%ProgramFiles%"
            for /f "delims=" %%f in ('dir /ad /b "!__PATH!\GWindows-*" 2^>NUL') do set "_GWINDOWS_HOME=!__PATH!\%%f"
        )
    )
    if defined _GWINDOWS_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default GWindows installation directory "!_GWINDOWS_HOME!" 1>&2
    )
)
set __RESEDIT_CMD=
for /f "delims=" %%f in ('dir /b /s "%_GWINDOWS_HOME%\*.exe" 2^>NUL') do (
    set "__RESEDIT_CMD=%%f*
)
if not exist "%__RESEDIT_CMD%" (
    echo %_ERROR_LABEL% ResEdit executable not found ^("%_GWINDOWS_HOME%"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameters: _MSYS_HOME, _MSYS_PATH
:msys
set _MSYS_HOME=
set _MSYS_PATH=

set __MAKE_CMD=
for /f "delims=" %%f in ('where make.exe 2^>NUL') do set "__MAKE_CMD=%%f"
if defined __MAKE_CMD (
    for /f "delims=" %%i in ("%__MAKE_CMD%") do set "__MAKE_BIN_DIR=%%~dpi"
    for /f "delims=" %%f in ("!__MAKE_BIN_DIR!\.") do set "_MSYS_HOME=%%~dpf"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of GNU Make executable found in PATH 1>&2
    @rem keep _MSYS_PATH undefined since executable already in path
    goto :eof
) else if defined MSYS_HOME (
    set "_MSYS_HOME=%MSYS_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable MSYS_HOME 1>&2
) else (
    set __PATH=C:\opt
    for /f "delims=" %%f in ('dir /ad /b "!__PATH!\msys*" 2^>NUL') do set "_MSYS_HOME=!__PATH!\%%f"
    if not defined _MSYS_HOME (
        set "__PATH=ProgramFiles%"
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\msys*" 2^>NUL') do set "_MSYS_HOME=!__PATH!\%%f"
    )
)
if not exist "%_MSYS_HOME%\usr\bin\make.exe" (
    echo %_ERROR_LABEL% GNU Make executable not found ^("%_MSYS_HOME%"^) 1>&2
    set _MSYS_HOME=
    set _EXITCODE=1
    goto :eof
)
@rem 1st path -> (make.exe, python.exe), 2nd path -> gcc.exe
set "_MSYS_PATH=;%_MSYS_HOME%\usr\bin;%_MSYS_HOME%\mingw64\bin"
goto :eof

@rem output parameters: _VSCODE_HOME, _VSCODE_PATH
:vscode
set _VSCODE_HOME=
set _VSCODE_PATH=

set __CODE_CMD=
for /f "delims=" %%f in ('where code.exe 2^>NUL') do set "__CODE_CMD=%%f"
if defined __CODE_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of VSCode executable found in PATH 1>&2
    @rem keep _VSCODE_PATH undefined since executable already in path
    goto :eof
) else if defined VSCODE_HOME (
    set "_VSCODE_HOME=%VSCODE_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable VSCODE_HOME 1>&2
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\VSCode\" ( set "_VSCODE_HOME=!__PATH!\VSCode"
    ) else (
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\VSCode-1*" 2^>NUL') do set "_VSCODE_HOME=!__PATH!\%%f"
        if not defined _VSCODE_HOME (
            set "__PATH=%ProgramFiles%"
            for /f "delims=" %%f in ('dir /ad /b "!__PATH!\VSCode-1*" 2^>NUL') do set "_VSCODE_HOME=!__PATH!\%%f"
        )
    )
)
if not exist "%_VSCODE_HOME%\code.exe" (
    echo %_ERROR_LABEL% VSCode executable not found ^("%_VSCODE_HOME%"^) 1>&2
    if exist "%_VSCODE_HOME%\Code - Insiders.exe" (
        echo %_WARNING_LABEL% It looks like you've installed an Insider version of VSCode 1>&2
    )
    set _EXITCODE=1
    goto :eof
)
set "_VSCODE_PATH=;%_VSCODE_HOME%"
goto :eof

:print_env
set __VERBOSE=%1
set __VERSIONS_LINE1=
set __VERSIONS_LINE2=
set __WHERE_ARGS=
where /q "%ADACTL_HOME%:adactl.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,3,*" %%i in ('"%ADACTL_HOME%\adactl.exe" -h version 2^>^&1') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% adactl %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%ADACTL_HOME%:adactl.exe"
)
where /q "%GNAT_HOME%\bin:alr.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,*" %%i in ('"%GNAT_HOME%\bin\alr.exe" --version') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% alr %%j,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GNAT_HOME%\bin:alr.exe"
)
where /q "%GNAT_HOME%\bin:gcc.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,3,*" %%i in ('"%GNAT_HOME%\bin\gcc.exe" --version ^| findstr GCC') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% gcc %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GNAT_HOME%\bin:gcc.exe"
)
where /q "%GNAT_HOME%\bin:gnat.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1-3,*" %%i in ('"%GNAT_HOME%\bin\gnat.exe" --version ^| findstr GNAT') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% gnat %%j %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GNAT_HOME%\bin:gnat.exe"
)
where /q "%MSYS_HOME%\usr\bin:make.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,3,*" %%i in ('"%MSYS_HOME%\usr\bin\make.exe" --version 2^>^&1 ^| findstr Make') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% make %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%MSYS_HOME%\usr\bin:make.exe"
)
where /q "%GIT_HOME%\bin:git.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,*" %%i in ('"%GIT_HOME%\bin\git.exe" --version') do (
        for /f "delims=. tokens=1,2,3,*" %%a in ("%%k") do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% git %%a.%%b.%%c,"
    )
    set __WHERE_ARGS=%__WHERE_ARGS% "%GIT_HOME%\bin:git.exe"
)
where /q "%GIT_HOME%\usr\bin:diff.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1-3,*" %%i in ('"%GIT_HOME%\usr\bin\diff.exe" --version ^| findstr diff') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% diff %%l,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GIT_HOME%\usr\bin:diff.exe"
)
where /q "%GIT_HOME%\bin:bash.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1-3,4,*" %%i in ('"%GIT_HOME%\bin\bash.exe" --version ^| findstr bash') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% bash %%l"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GIT_HOME%\bin:bash.exe"
)
echo Tool versions:
echo   %__VERSIONS_LINE1%
echo   %__VERSIONS_LINE2%
if %__VERBOSE%==1 (
    echo Tool paths: 1>&2
    for /f "tokens=*" %%p in ('where %__WHERE_ARGS%') do (
        set "__LINE=%%p"
        setlocal enabledelayedexpansion
        echo    !__LINE:%USERPROFILE%=%%USERPROFILE%%! 1>&2
    )
    echo Environment variables: 1>&2
    if defined ADACTL_HOME echo    "ADACTL_HOME=%ADACTL_HOME%" 1>&2
    if defined GIT_HOME echo    "GIT_HOME=%GIT_HOME%" 1>&2
    if defined GNAT_HOME echo    "GNAT_HOME=%GNAT_HOME%" 1>&2
    if defined GNAT2019_HOME echo    "GNAT2019_HOME=%GNAT2019_HOME%" 1>&2
    if defined GWINDOWS_HOME echo    "GWINDOWS_HOME=%GWINDOWS_HOME%" 1>&2
    if defined MSYS_HOME echo    "MSYS_HOME=%MSYS_HOME%" 1>&2
    if defined VSCODE_HOME echo    "VSCODE_HOME=%VSCODE_HOME%" 1>&2
    echo Path associations: 1>&2
    for /f "delims=" %%i in ('subst') do (
        set "__LINE=%%i"
        setlocal enabledelayedexpansion
        echo    !__LINE:%USERPROFILE%=%%USERPROFILE%%! 1>&2
    )
)
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
endlocal & (
    if %_EXITCODE%==0 (
        if not defined ADACTL_HOME set "ADACTL_HOME=%_ADACTL_HOME%"
        if not defined GIT_HOME set "GIT_HOME=%_GIT_HOME%"
        if not defined GNAT_HOME set "GNAT_HOME=%_GNAT_HOME%"
        if not defined GNAT2019_HOME set "GNAT2019_HOME=%_GNAT2019_HOME%"
        if not defined GWINDOWS_HOME set "GWINDOWS_HOME=%_GWINDOWS_HOME%"
        if not defined MSYS_HOME set "MSYS_HOME=%_MSYS_HOME%"
        if not defined VSCODE_HOME set "VSCODE_HOME=%VSCODE_HOME%"
        @rem We prepend %_GIT_HOME%\bin to hide C:\Windows\System32\bash.exe
        set "PATH=%_GIT_HOME%\bin;%PATH%%_MSYS_PATH%%_GNAT_PATH%%_GIT_PATH%%_VSCODE_PATH%;%~dp0bin"
        call :print_env %_VERBOSE%
        if not "%CD:~0,2%"=="%_DRIVE_NAME%" (
            if %_DEBUG%==1 echo %_DEBUG_LABEL% cd /d %_DRIVE_NAME% 1>&2
            cd /d %_DRIVE_NAME%
        )
        if %_BASH%==1 (
            @rem see https://conemu.github.io/en/GitForWindows.html
            if %_DEBUG%==1 echo %_DEBUG_LABEL% "%_GIT_HOME%\usr\bin\bash.exe" --login 1>&2
            cmd.exe /c "%_GIT_HOME%\usr\bin\bash.exe --login"
        )
    )
    if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
    for /f "delims==" %%i in ('set ^| findstr /b "_"') do set %%i=
)
