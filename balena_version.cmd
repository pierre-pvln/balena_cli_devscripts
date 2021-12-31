@ECHO off
::
:: @name:     balena_version.cmd
:: @purpose:  show the current version of balena cli
::
:: @version   v0.0.5  2021-12-31
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

ECHO [INFO ] Start running %ME%
ECHO.
:: Check balenadev scripts with github 
:: ===================================
ECHO [INFO ] Are we up to date with the balenadev scripts? ...
::    -s, --short           show status concisely
::    -b, --branch          show branch information
git status -s -b
ECHO.
timeout /T 5
CD %CMD_DIR%

ECHO.
ECHO [INFO ] Balena CLI Settings
ECHO.
CALL "%BALENA_CLI%" version
CD %CMD_DIR%

ECHO.
PAUSE
