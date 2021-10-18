@ECHO off
::
:: @name:     balena_login.cmd
:: @purpose:  login to balena
::
:: @version:  v0.0.5  2021-09-29
:: @author:   pierre@ipheion.eu
:: @copyright: (C) 2020-2021 Pierre Veelen
::

SET ERROR_MESSAGE=[INFO ] No error

IF EXIST "..\..\.settings\.token" (
	SET /p BALENA_APITOKEN=<"..\..\.settings\.token"
)

IF "%BALENA_APITOKEN%" == "" (
	SET ERROR_MESSAGE=[ERROR] file ..\..\.settings\.token does not exist or is empty ...
	GOTO :ERROR_EXIT_SUBSCRIPT
)

call "C:\Program Files\balena-cli\bin\balena" logout

call "C:\Program Files\balena-cli\bin\balena" login --token "%BALENA_APITOKEN%"

call "C:\Program Files\balena-cli\bin\balena" whoami

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO %ERROR_MESSAGE%
::timeout /T 5
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT
ECHO [INFO ] Login settings updated ...
ECHO.
::timeout /T 5
EXIT /B 0
