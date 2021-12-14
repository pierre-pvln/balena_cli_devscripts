@ECHO off
::
:: @name:     balena_login.cmd
:: @purpose:  login to balena
::
:: @version   v0.0.4  2021-12-14
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

SET ERROR_MESSAGE=[INFO ] No error

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

CALL .\utils\balena_organization.cmd
CD %CMD_DIR%

CALL .\utils\balena_application.cmd
CD %CMD_DIR%

:: set API Token
IF EXIST "..\..\.settings\.token" (
	SET /p BALENA_APITOKEN=<"..\..\.settings\.token"
)

IF "%BALENA_APITOKEN%" == "" (
	SET ERROR_MESSAGE=[ERROR] file ..\..\.settings\.token does not exist or is empty ...
	GOTO ERROR_EXIT
)

CALL "%BALENA_CLI%" logout

CALL "%BALENA_CLI%" login --token "%BALENA_APITOKEN%"

CALL "%BALENA_CLI%" whoami

GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%

:CLEAN_EXIT
CD %CMD_DIR%

ECHO.
PAUSE
