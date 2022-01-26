@ECHO off
:: =================================================================
::
:: @name:     balena_scan.cmd
:: @purpose:  scan for local hardware
::
:: @version   v0.0.6  2022-01-26
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2022 Pierre Veelen
::
:: =================================================================

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

ECHO [INFO ] Start running %ME%
ECHO.

:: GIT / GITHUB CHECK
:: ==================
CALL .\utils\check_github.cmd
timeout /T 5
CD %CMD_DIR%

:: BALENA SETTINGS
:: ===============
SET "BALENA_CLI=C:\Program Files\balena-cli\bin\balena"

ECHO.
ECHO [INFO ] Scan for local Balena hardware
ECHO.
CALL "%BALENA_CLI%" scan 
CD %CMD_DIR%

ECHO.
PAUSE
