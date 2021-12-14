@ECHO off
::
:: @name:     balena_envs_set.cmd
:: @purpose:  set balena environment settings
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

CALL .\utils\balena_fleet.cmd
CD %CMD_DIR%

CALL .\utils\balena_version.cmd
CD %CMD_DIR%

ECHO.
ECHO [INFO ] Set environment variables ...
CALL "%BALENA_CLI%" env add THIS_CODE_FOLDER %BALENA_FLEET% -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "%BALENA_CLI%" env add THIS_VERSION_FOLDER %BALENA_VERSION_FOLDER% -f %BALENA_ORGANIZATION%/%BALENA_FLEET%

ECHO.
ECHO [INFO ] Set any "configuration variables" that control balena platform features ...
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

ECHO.
PAUSE
