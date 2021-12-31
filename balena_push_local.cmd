@ECHO off
::
:: @name:     balena_push_local.cmd
:: @purpose:  (re)build the container(s) direct to local device
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

SET ERROR_MESSAGE=[INFO ] No error ...

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
ECHO [INFO ] Start building container(s) on local machine ...
ECHO [INFO ] Building as:
CALL "%BALENA_CLI%" whoami
CD %CMD_DIR%
ECHO.

CD ..\containers
:: Build a fresh image, preventing the use of cached imaged layers from previous builds of this project   
:: https://www.balena.io/docs/learn/deploy/deployment/#balena-push
:: https://www.balena.io/docs/learn/deploy/deployment/#--nocache--c
:: https://www.balena.io/docs/learn/develop/local-mode/#push-over-a-new-project
CALL "%BALENA_CLI%" push 192.168.2.29 --nocache
CD %CMD_DIR%

ECHO.
PAUSE
