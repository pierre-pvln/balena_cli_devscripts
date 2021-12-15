@ECHO off
::
:: @name:     balena_envs_get.cmd
:: @purpose:  show the balena environment settings
::
:: @version   v0.0.6  2021-12-14
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
::

SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET ME=%~n0
:: Setting the name of the directory
SET PARENT=%~p0
SET PDRIVE=%~d0
:: Setting the directory and drive of this commandfile
SET CMD_DIR=%~dp0

SET ERROR_MESSAGE=[INFO ] No error ...

:: BALENA SETTINGS
:: ===============
SET "BALENA_CLI=C:\Program Files\balena-cli\bin\balena"

:: Check balenadev scripts with github 
:: ===================================
ECHO [INFO ] Are we up to date with the balenadev scripts? ...
::    -s, --short           show status concisely
::    -b, --branch          show branch information
git status -s -b
ECHO.
timeout /T 5
CD %CMD_DIR%

CALL .\utils\balena_login.cmd
IF %ERRORLEVEL% NEQ 0 (
	SET ERROR_MESSAGE=[ERROR] Setting login credentials not succesfull ...  		
	GOTO ERROR_EXIT
)
CD %CMD_DIR%

CALL .\utils\balena_organization.cmd
CD %CMD_DIR%

CALL .\utils\balena_fleet.cmd
CD %CMD_DIR%

CALL .\utils\balena_version.cmd
CD %CMD_DIR%

::	 
:: The actual programs/scripts to run
::
ECHO.
ECHO [INFO ] List the "configuration variables" that control balena platform features ...
CALL "%BALENA_CLI%" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --config --json
CD %CMD_DIR%

ECHO.

ECHO [INFO ] List the environment variables ...
CALL "%BALENA_CLI%" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --json
CD %CMD_DIR%
ECHO.
::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --json
::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --service AIS-dispatcher --json
::
GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%
ECHO.

:CLEAN_EXIT
CD %CMD_DIR%

ECHO.
PAUSE
