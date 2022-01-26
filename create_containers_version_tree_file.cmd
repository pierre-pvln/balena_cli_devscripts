@ECHO off
:: =================================================================
::
:: @name:     create_containers_version_tree_file.cmd
:: @purpose:  create file with the tree of all the files for a balena fleet version or release
::
:: @version   v0.0.2  2022-01-26
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2022 Pierre Veelen
::
:: =================================================================

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

:: GIT / GITHUB CHECK
:: ==================
CALL .\utils\check_github.cmd
timeout /T 5
CD %CMD_DIR%

:: BALENA SETTINGS
:: ===============
SET "BALENA_CLI=C:\Program Files\balena-cli\bin\balena"

CALL .\utils\balena_login.cmd
IF %ERRORLEVEL% NEQ 0 (
	SET ERROR_MESSAGE=[ERROR] Setting login credentials not succesfull ...  		
	GOTO ERROR_EXIT
)
CD %CMD_DIR%

CALL .\utils\balena_organization.cmd
CD %CMD_DIR%

CALL .\utils\balena_fleet.cmd
CD %CMD_DIR%

CALL .\utils\balena_version.cmd
CD %CMD_DIR%

::	 
:: The actual programs/scripts to run
::
ECHO.
ECHO [INFO ] Creating file ..\containers\fleet_containers_tree.txt ...
tree /f /a ..\containers >..\containers\fleet_containers_tree.txt
CD %CMD_DIR%

ECHO.
GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO %ERROR_MESSAGE%
ECHO.

:CLEAN_EXIT
CD %CMD_DIR%

ECHO.
PAUSE
