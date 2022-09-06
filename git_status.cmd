@ECHO off
::
:: @name:     git_status.cmd
:: @purpose:  check status at github
::
:: @version   v0.0.1  2022-01-12
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2022 Pierre Veelen
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

ECHO [INFO ] Start running %ME%
ECHO.
:: Check service configuration at github 
:: =====================================
ECHO [INFO ] Are we up to date with the service version? ...
ECHO.

git remote -v update
ECHO.

::    -s, --short           show status concisely
::    -b, --branch          show branch information
git status -s -b
ECHO.
timeout /T 5
CD %CMD_DIR%




GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO.
ECHO %ERROR_MESSAGE%
ECHO.

:CLEAN_EXIT
CD %CMD_DIR%

ECHO.
PAUSE