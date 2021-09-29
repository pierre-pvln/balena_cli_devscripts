@ECHO off
::
:: @name:     balena_envs_get.cmd
:: @purpose:  show the balena environment settings
::
:: @version   v0.0.5  2021-09-29
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

ECHO [INFO ] Are we up to date? ...
::    -s, --short           show status concisely
::    -b, --branch          show branch information
git status -s -b
ECHO.
cd %CMD_DIR%

call .\utils\balena_login.cmd
IF %ERRORLEVEL% NEQ 0 (
	SET ERROR_MESSAGE=[ERROR] Setting login credentials not succesfull ...  		
	GOTO :ERROR_EXIT
)
cd %CMD_DIR%

CALL .\utils\balena_organization.cmd
CD %CMD_DIR%

CALL .\utils\balena_fleet.cmd
CD %CMD_DIR%

::	 
:: The actual programs/scripts to run
::
cd ..\containers
ECHO [INFO ] List the "configuration variables" that control balena platform features ...
call "C:\Program Files\balena-cli\bin\balena" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --config --json
ECHO.

ECHO [INFO ] List the environment variables ...
call "C:\Program Files\balena-cli\bin\balena" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --json
ECHO.

::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --json
::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --service AIS-dispatcher --json
::
GOTO :CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%
ECHO.
::timeout /T 5

:CLEAN_EXIT
CD %CMD_DIR%

::timeout /T 5
PAUSE
