@echo off
setlocal enabledelayedexpansion

@rem only for interactive debugging !
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

for %%i in (%_COMMANDS%) do (
    call :%%i
    if not !_EXITCODE!==0 goto end
)
goto end

@rem #########################################################################
@rem ## Subroutines

@rem output parameters: _DEBUG_LABEL, _ERROR_LABEL, _WARNING_LABEL
@rem                    _CLASSES_DIR, _TARGET_DIR, _TARGET_DOCS_DIR
:env
set _BASENAME=%~n0
set "_ROOT_DIR=%~dp0"

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:

set "_SOURCE_DIR=%_ROOT_DIR%src"
set "_SOURCE_MAIN_DIR=%_SOURCE_DIR%\main\ada"
set "_TARGET_DIR=%_ROOT_DIR%target"
set "_TARGET_OBJ_DIR=%_TARGET_DIR%\obj"

@rem required for gnatdoc
if not exist "%_ROOT_DIR%build.gpr" (
    echo %_ERROR_LABEL% GNAT Ada project file not found 1>&2
    set _EXITCODE=1
    goto :eof
)
if not exist "%GNAT_HOME%\bin\gnatmake.exe" (
    echo %_ERROR_LABEL% GNAT installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_GNATMAKE_CMD=%GNAT_HOME%\bin\gnatmake.exe"
set "_GNATDOC_CMD=%GNAT_HOME%\bin\gnatdoc.exe"

set _MSYS_GNATMAKE_CMD=
if exist "%MSYS_HOME%\mingw64\bin\gnatmake.exe" (
    set "_MSYS_GNATMAKE_CMD=%MSYS_HOME%\mingw64\bin\gnatmake.exe"
)
set "_ADACTL_CMD=
if exist "%ADACTL_HOME%\adactl.exe" (
    set "_ADACTL_CMD=%ADACTL_HOME%\adactl.exe"
)
set _DIFF_CMD=
if exist "%GIT_HOME%\usr\bin\diff.exe" (
    set "_DIFF_CMD=%GIT_HOME%\usr\bin\diff.exe" 
)
@rem use newer PowerShell version if available
where /q pwsh.exe
if %ERRORLEVEL%==0 ( set _PWSH_CMD=pwsh.exe
) else ( set _PWSH_CMD=powershell.exe
)
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

@rem we defined _RESET in last position to avoid crazy console output with type command
set _BOLD=[1m
set _UNDERSCORE=[4m
set _INVERSE=[7m
set _RESET=[0m
goto :eof

@rem input parameter: %*
:args
set _COMMANDS=
set _MSYS=0
set _TIMER=0
set _VERBOSE=0
set __N=0
:args_loop
set "__ARG=%~1"
if not defined __ARG (
    if !__N!==0 set _COMMANDS=help
    goto args_done
)
if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-help" ( set _HELP=1
    ) else if "%__ARG%"=="-msys" ( set _MSYS=1
    ) else if "%__ARG%"=="-timer" ( set _TIMER=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
) else (
    @rem subcommand
    if "%__ARG%"=="clean" ( set _COMMANDS=!_COMMANDS! clean
    ) else if "%__ARG%"=="compile" ( set _COMMANDS=!_COMMANDS! compile
    ) else if "%__ARG%"=="doc" ( set _COMMANDS=!_COMMANDS! doc
    ) else if "%__ARG%"=="help" ( set _COMMANDS=help
    ) else if "%__ARG%"=="lint" ( set _COMMANDS=!_COMMANDS! lint
    ) else if "%__ARG%"=="run" ( set _COMMANDS=!_COMMANDS! compile run
    ) else if "%__ARG%"=="test" ( set _COMMANDS=!_COMMANDS! compile test
    ) else (
        echo %_ERROR_LABEL% Unknown subcommand "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
    set /a __N+=1
)
shift
goto args_loop
:args_done
set _STDERR_REDIRECT=2^>NUL
if %_DEBUG%==1 set _STDERR_REDIRECT=

set _MAIN_NAME=main
set _MAIN_ARGS=

set "_SOURCE_MAIN_FILE=%_SOURCE_MAIN_DIR%\%_MAIN_NAME%.adb"
for %%i in ("%~dp0\.") do set "_PROJECT_NAME=%%~ni"
set "_EXE_FILE=%_TARGET_DIR%\%_PROJECT_NAME%.exe"

if %_MSYS%==1 if not defined _MSYS_GNATMAKE_CMD (
    echo %_WARNING_LABEL% MSYS GNAT Make not found; use standard GNAT Make instead 1>&2
    set _MSYS=0
)
if not "!_COMMANDS:lint=!"=="%_COMMANDS%" (
    if not exist "%GNAT2019_HOME%\bin\gnat.exe" (
        echo %_WARNING_LABEL% GNAT 2019 is required to execute AdaControl 1>&2
        set "_COMMANDS=!_COMMANDS:lint=!"
    ) else (
        for %%f in ("%_ROOT_DIR%.") do set "__PARENT_DIR=%%~dpf"
        for /f "delims=" %%f in ('dir /b /s "!__PARENT_DIR!*.aru"') do set "_ARU_FILE=%%f"
        if not exist "!_ARU_FILE!" (
            echo %_WARNING_LABEL% ARU file not found 1>&2
            set "_COMMANDS=!_COMMANDS:lint=!"
        )
    )
)
if not "!_COMMANDS:compile=!"=="%_COMMANDS%" if defined _MSYS if not defined _MSYS_GNATMAKE_CMD (
    echo %_WARNING_LABEL% MSYS GNAT Make not found; use standard GNAT Make instead 1>&2
    set _MSYS=0
)
if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Options    : _TIMER=%_TIMER% _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: %_COMMANDS% 1>&2
    echo %_DEBUG_LABEL% Variables  : "ADACTL_HOME=%ADACTL_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "GIT_HOME=%GIT_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "GNAT_HOME=%GNAT_HOME%" 1>&2
	echo %_DEBUG_LABEL% Variables  : "GNAT2019_HOME=%GNAT2019_HOME%" 1>&2
    if defined MSYS_HOME echo %_DEBUG_LABEL% Variables  : "MSYS_HOME=%MSYS_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : _MAIN_NAME=%_MAIN_NAME% _MAIN_ARGS=%_MAIN_ARGS% 1>&2
    echo %_DEBUG_LABEL% Variables  : _PROJECT_NAME=%_PROJECT_NAME% 1>&2
)
if %_TIMER%==1 for /f "delims=" %%i in ('call "%_PWSH_CMD%" -c "(Get-Date)"') do set _TIMER_START=%%i
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
echo     %__BEG_O%-debug%__END%      print commands executed by this script
echo     %__BEG_O%-msys%__END%       use MSYS GNAT Make if available
echo     %__BEG_O%-timer%__END%      print total execution time
echo     %__BEG_O%-verbose%__END%    print progress messages
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%clean%__END%       delete generated files
echo     %__BEG_O%compile%__END%     compile Ada source files
echo     %__BEG_O%doc%__END%         generate HTML documentation
echo     %__BEG_O%help%__END%        print this help message
echo     %__BEG_O%lint%__END%        analyze Ada source files with %__BEG_N%AdaControl%__END%
echo     %__BEG_O%run%__END%         execute main program "%__BEG_O%%_MAIN_NAME%%__END%"
echo     %__BEG_O%test%__END%        execute unit tests with %__BEG_N%AUnit%__END%
goto :eof

:clean
call :rmdir "%_TARGET_DIR%"
goto :eof

@rem input parameter: %1=directory path
:rmdir
set "__DIR=%~1"
if not exist "%__DIR%\" goto :eof
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% rmdir /s /q "%__DIR%" 1>&2
) else if %_VERBOSE%==1 ( echo Delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
)
rmdir /s /q "%__DIR%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:lint
if not exist "%_TARGET_DIR%" mkdir "%_TARGET_DIR%" 1>NUL

@rem set "__GPR_FILE=%_ROOT_DIR%%_PROJECT_NAME%.gpr"
set "__LOG_FILE=%_TARGET_DIR%\adactl_log.txt"

@rem AdaControl requires the GNAT 2019 tool chain
set "__PATH=%PATH%"
set "PATH=%GNAT2019_HOME%\bin;%PATH%"
if %_DEBUG%==1 (
    for /f "delims=" %%f in ('where gcc') do set "__GCC_CMD=%%f"
    echo %_DEBUG_LABEL% GCC command is: !__GCC_CMD! 1>&2
)
@rem see https://www.adalog.fr/compo/adacontrol_ug.html#command-files-provided-with-AdaControl
set __ADACTL_OPTS=-f "%_ARU_FILE%" -o "%__LOG_FILE%" -w
if %_DEBUG%==1 ( set __ADACTL_OPTS=-d -v %__ADACTL_OPTS%
) else if %_VERBOSE%==1 ( set __ADACTL_OPTS=-v %__ADACTL_OPTS%
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_ADACTL_CMD%" %__ADACTL_OPTS% "%_SOURCE_MAIN_DIR%"\* 1>&2
) else if %_VERBOSE%==1 ( echo Analyze Ada source files 1>&2
)
pushd "%_TARGET_DIR%"
call "%_ADACTL_CMD%" %__ADACTL_OPTS% "%_SOURCE_MAIN_DIR%"\*
if not %ERRORLEVEL%==0 (
    if %_DEBUG%==1 ( type "%__LOG_FILE%"
    ) else if %_VERBOSE%==1 ( type "%__LOG_FILE%"
    )
    popd
    set "PATH=%__PATH%"
    set _EXITCODE=1
    goto :eof
)
popd
set "PATH=%__PATH%"
goto :eof

:compile
if not exist "%_TARGET_OBJ_DIR%" mkdir "%_TARGET_OBJ_DIR%" 1>NUL

set __N=0
for /f "delims=" %%f in ('dir /b /s "%_SOURCE_MAIN_DIR%\*.ad?" 2^>NUL') do (
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Ada source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Ada source file
) else ( set __N_FILES=%__N% Ada source files
)
if %_MSYS%==1 ( set "__GNATMAKE_CMD=%_MSYS_GNATMAKE_CMD%"
) else ( set "__GNATMAKE_CMD=%_GNATMAKE_CMD%"
)
@rem -we : Treat all warnings as errors
set __GNATMAKE_OPTS=-gnat2022 -we -I"%_SOURCE_MAIN_DIR%" -D "%_TARGET_OBJ_DIR%" -o "%_EXE_FILE%"
if %_DEBUG%==1 set __GNATMAKE_OPTS=-d %__GNATMAKE_OPTS%

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%__GNATMAKE_CMD%" %__GNATMAKE_OPTS% "%_SOURCE_MAIN_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_TARGET_OBJ_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%__GNATMAKE_CMD%" %__GNATMAKE_OPTS% "%_SOURCE_MAIN_FILE%" %_STDERR_REDIRECT%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_TARGET_OBJ_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:doc
if not exist "%_TARGET_OBJ_DIR%" mkdir "%_TARGET_OBJ_DIR%"
if not exist "%_TARGET_DIR%\html" mkdir "%_TARGET_DIR%\html"

@rem https://docs.adacore.com/live/wave/gps/html/gnatdoc-doc/gnatdoc.html
@rem Options: -p=Process private part of packages
set __GNATDOC_OPTS=-d -p "--project=%_ROOT_DIR%build.gpr" --output=html

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_GNATDOC_CMD%" %__GNATDOC_OPTS% 1>&2
) else if %_VERBOSE%==1 ( echo Generate HTML documentation into directory "!_TARGET_DIR:%_ROOT_DIR%=!\html" 1>&2
)
call "%_GNATDOC_CMD%" %__GNATDOC_OPTS%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to generate HTML documentation into directory "!_TARGET_DIR:%_ROOT_DIR%=!\html" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:run
if not exist "%_EXE_FILE%" (
    echo %_ERROR_LABEL% Main program "%_PROJECT_NAME%" not found ^(%_EXE_FILE%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_EXE_FILE%" %_MAIN_ARGS% 1>&2
) else if %_VERBOSE%==1 ( echo Execute Ada program "!_EXE_FILE:%_ROOT_DIR%=!" 1>&2
)
call "%_EXE_FILE%" %_MAIN_ARGS%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute Ada program "!_EXE_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile_test
echo %_WARNING_LABEL% Not yet implemented 1>&2
goto :eof

:test
echo %_WARNING_LABEL% Subcommand 'test' is not yet implemented 1>&2
goto :eof

@rem output parameter: _DURATION
:duration
set __START=%~1
set __END=%~2

for /f "delims=" %%i in ('call "%_PWSH_CMD%" -c "$interval = New-TimeSpan -Start '%__START%' -End '%__END%'; Write-Host $interval"') do set _DURATION=%%i
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
if %_TIMER%==1 (
    for /f "delims=" %%i in ('call "%_PWSH_CMD%" -c "(Get-Date)"') do set __TIMER_END=%%i
    call :duration "%_TIMER_START%" "!__TIMER_END!"
    echo Total execution time: !_DURATION! 1>&2
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
exit /b %_EXITCODE%
endlocal
