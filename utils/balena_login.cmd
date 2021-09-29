@ECHO off
::
:: @name:     balena_login.cmd
:: @purpose:  login to balena
::
:: @version   v0.0.4  2021-08-26
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

call .\utils\balena_organization.cmd
cd %CMD_DIR%

call .\utils\balena_application.cmd
cd %CMD_DIR%

:: set python / conda environment
IF EXIST "..\..\.settings\.token" (
	SET /p BALENA_APITOKEN=<"..\..\.settings\.token"
)

IF "%BALENA_APITOKEN%" == "" (
	SET ERROR_MESSAGE=[ERROR] file ..\..\.settings\.token does not exist or is empty ...
	GOTO :ERROR_EXIT
)

call "C:\Program Files\balena-cli\bin\balena" logout

call "C:\Program Files\balena-cli\bin\balena" login --token "%BALENA_APITOKEN%"

call "C:\Program Files\balena-cli\bin\balena" whoami

GOTO :CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%

:CLEAN_EXIT
CD %CMD_DIR%

PAUSE
