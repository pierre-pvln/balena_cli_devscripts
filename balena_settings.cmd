@ECHO off
::
:: @name:     balena_settings.cmd
:: @purpose:  show the settings from balena CLI
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

ECHO [INFO ] Balena CLI Settings
ECHO.
CALL "C:\Program Files\balena-cli\bin\balena" settings

CD %CMD_DIR%

PAUSE
