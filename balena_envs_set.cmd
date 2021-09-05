@ECHO off
::
:: @name:     balena_envs_set.cmd
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

cd %CMD_DIR%
call .\utils\balena_organization.cmd

cd %CMD_DIR%
call .\utils\balena_fleet.cmd

CD %CMD_DIR%
CALL .\envs\cm4io_usb_on.cmd

::CD %CMD_DIR%
::CALL .\envs\ais_daysi_hat.cmd

CD %CMD_DIR%
pause
