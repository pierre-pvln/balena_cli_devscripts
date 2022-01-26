@ECHO off
:: =================================================================
::
:: @name:     balena_push_local.cmd
:: @purpose:  (re)build the container(s) direct to local device
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
