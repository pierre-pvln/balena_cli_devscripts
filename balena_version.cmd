@ECHO off
::
:: @name:     balena_version.cmd
:: @purpose:  show te current version of balena
::
:: @version   v0.0.3  2021-08-26
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
::
ECHO Balena CLI version:
CALL "C:\Program Files\balena-cli\bin\balena" version

PAUSE
