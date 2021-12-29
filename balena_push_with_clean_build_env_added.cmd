@ECHO off
::
:: @name:     balena_push_with_clean_build_env_added.cmd
:: @purpose:  (re)build the container(s)
::
:: @version   v0.0.6  2021-12-15
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
ECHO [INFO ] Start building container(s) ...
ECHO [INFO ] Building as:
CALL "C:\Program Files\balena-cli\bin\balena" whoami
CD %CMD_DIR%
ECHO.

CD ..\containers
:: Build a fresh image, preventing the use of cached imaged layers from previous builds of this project   
:: https://www.balena.io/docs/learn/deploy/deployment/#balena-push
:: https://www.balena.io/docs/learn/deploy/deployment/#--nocache--c

::call "C:\Program Files\balena-cli\bin\balena" push daya-mqtt-python-64 --pull
::call "C:\Program Files\balena-cli\bin\balena" push daya-mqtt-python-64 --nocache --debug
CALL "%BALENA_CLI%" push %BALENA_ORGANIZATION%/%BALENA_FLEET% --nocache --multi-dockerignore
IF %errorlevel% EQU 0 (
	:: Set info on folders used for code and settings
	CALL "%BALENA_CLI%" env add THIS_CODE_FOLDER %BALENA_FLEET% -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
	CALL "%BALENA_CLI%" env add THIS_VERSION_FOLDER %BALENA_VERSION_FOLDER% -f %BALENA_ORGANIZATION%/%BALENA_FLEET%

	CD %CMD_DIR%
	IF EXIST "..\containers\cm4io_usb_on" (
		CALL .\envs\cm4io_usb_on.cmd
	)

	CD %CMD_DIR%
	IF EXIST "..\containers\ais_daysi_hat" (
		CALL .\envs\ais_daysi_hat.cmd
	)

    CD %CMD_DIR%
	IF EXIST "..\containers\envs_for_services" (
		CALL .\envs\envs_for_services.cmd
	)

    CD %CMD_DIR%
	IF EXIST "..\containers\%BALENA_FLEET%.cmd" (
		CALL "..\containers\%BALENA_FLEET%.cmd"
	)
) ELSE (
	SET ERROR_MESSAGE=[ERROR] Did not set enviroment vars ...
	GOTO :ERROR_EXIT
)

GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%
ECHO.

:CLEAN_EXIT
CD %CMD_DIR%

ECHO.
PAUSE
