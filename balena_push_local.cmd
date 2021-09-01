@ECHO off
::
:: @name:     balena_push_local.cmd
:: @purpose:  (re)build the container(s) direct to local device
::
:: @version   v0.0.3  2021-08-26
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

ECHO [INFO ] Start building container(s) ...
ECHO [INFO ] Building as:
CALL "C:\Program Files\balena-cli\bin\balena" whoami
ECHO.

cd ..\containers
:: Build a fresh image, preventing the use of cached imaged layers from previous builds of this project   
:: https://www.balena.io/docs/learn/deploy/deployment/#balena-push
:: https://www.balena.io/docs/learn/deploy/deployment/#--nocache--c
:: https://www.balena.io/docs/learn/develop/local-mode/#push-over-a-new-project

call "C:\Program Files\balena-cli\bin\balena" push 192.168.2.5 --nocache

cd %CMD_DIR%

pause
