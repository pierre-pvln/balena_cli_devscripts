::
:: @name:     balena_login.cmd
:: @purpose:  login to balena
::
:: @version:  v0.0.6  2021-12-15
:: @author:   pierre@ipheion.eu
:: @copyright: (C) 2020-2021 Pierre Veelen
::

SET ERROR_MESSAGE=[INFO ] No error

IF EXIST "..\..\.settings\.token" (
	SET /p BALENA_APITOKEN=<"..\..\.settings\.token"
)

IF "%BALENA_APITOKEN%" == "" (
	SET ERROR_MESSAGE=[ERROR] file ..\..\.settings\.token does not exist or is empty ...
	GOTO ERROR_EXIT_SUBSCRIPT
)

CALL "%BALENA_CLI%" logout

CALL "%BALENA_CLI%" login --token "%BALENA_APITOKEN%"

CALL "%BALENA_CLI%" whoami

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO.
ECHO %ERROR_MESSAGE%
ECHO.
::timeout /T 5
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT
ECHO.
ECHO [INFO ] Login settings updated ...
ECHO.
::timeout /T 5
EXIT /B 0
