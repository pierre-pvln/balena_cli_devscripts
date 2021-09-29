@ECHO off
::
:: @name:     balena_envs_get.cmd
:: @purpose:  show the balena environment settings
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

call .\utils\balena_organization.cmd
cd %CMD_DIR%

call .\utils\balena_fleet.cmd
cd %CMD_DIR%

cd ..\containers
ECHO [INFO ] List the "configuration variables" that control balena platform features ...
call "C:\Program Files\balena-cli\bin\balena" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --config --json

ECHO [INFO ] List the environment variables ...
call "C:\Program Files\balena-cli\bin\balena" envs --application %BALENA_ORGANIZATION%/%BALENA_FLEET% --json


::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --json
::
::call "C:\Program Files\balena-cli\bin\balena" envs --device 7fc86c5 --service AIS-dispatcher --json
::

CD %CMD_DIR%

pause
