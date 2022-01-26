::
:: @name:     check_github.cmd
:: @purpose:  check if scripts are in sync with github version
::
:: @version   v0.0.1  2022-01-26
:: @author:   pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen

:: Check balenadev scripts with github 
:: ===================================
ECHO [INFO ] Are we up to date with the balenadev scripts? ...
git remote update
ECHO.
::    -s, --short           show status concisely
::    -b, --branch          show branch information
git status -s -b
ECHO.

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO.
ECHO %ERROR_MESSAGE%
ECHO.
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT
ECHO.
ECHO [INFO ] Balena version folder: %BALENA_VERSION_FOLDER% ...
ECHO.
EXIT /B 0
