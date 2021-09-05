@ECHO off
::
:: @name:     balena_push_with_pull_build_env_added.cmd
:: @purpose:  (re)build the container(s)
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

CD %CMD_DIR%
CALL .\utils\balena_organization.cmd

CD %CMD_DIR%
CALL .\utils\balena_fleet.cmd

CD %CMD_DIR%
ECHO [INFO ] Start building container(s) ...
ECHO [INFO ] Building as:
CALL "C:\Program Files\balena-cli\bin\balena" whoami
ECHO.

CD ..\containers
:: Build a fresh image, preventing the use of cached imaged layers from previous builds of this project   
:: https://www.balena.io/docs/learn/deploy/deployment/#balena-push
:: https://www.balena.io/docs/learn/deploy/deployment/#--nocache--c

::call "C:\Program Files\balena-cli\bin\balena" push daya-mqtt-python-64 --pull
::call "C:\Program Files\balena-cli\bin\balena" push daya-mqtt-python-64 --nocache --debug
CALL "C:\Program Files\balena-cli\bin\balena" push %BALENA_ORGANIZATION%/%BALENA_FLEET% --pull

CD %CMD_DIR%
CALL .\envs\cm4io_usb_on.cmd

::CD %CMD_DIR%
::CALL .\envs\ais_daysi_hat.cmd

CD %CMD_DIR%
PAUSE
