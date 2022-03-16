@echo off
setlocal enabledelayedexpansion

set _DEBUG=0

@rem #########################################################################
@rem ## Environment setup

set _EXITCODE=0

call :env
if not %_EXITCODE%==0 goto end

@rem #########################################################################
@rem ## Main

for %%i in (examples intro-to-ada shvets-examples) do (
    call :clean_projects "%_ROOT_DIR%%%i"
    if not !_EXITCODE!==0 goto end
)
goto end

@rem #########################################################################
@rem ## Subroutines

:env
set _BASENAME=%~n0
for /f "delims=" %%f in ("%~dp0.") do set "_ROOT_DIR=%%~dpf"

set _DEBUG_LABEL=[%_BASENAME%]
set _ERROR_LABEL=Error:
goto :eof

:clean_projects
set "__EXAMPLES_DIR=%~1"

for /f "delims=" %%f in ('dir /b /s "%__EXAMPLES_DIR%\build.bat"') do (
    set "__BATCH_FILE=%%f"
    if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%__BATCH_FILE%" clean 1>&2
    ) else ( echo Execute command "!__BATCH_FILE:%_ROOT_DIR%=!" clean 1>&2
    )
    call "!__BATCH_FILE!" clean
)
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
exit /b %_EXITCODE%
