::
:: @name:     balena_fleet.cmd
:: @purpose:  set the fleet name as an environment variable
::
:: @version   v0.0.3  2021-08-26
:: @author:   pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
:: @revision: 2018 07 16 - initial version
::            2018 07 24 - build process unified and extension as environment variable
::            2018 08 21 - the name of the extension is its root folder unless otherwise specified
::            2019 05 29 - getting extension name and prefix from folder structure
::            2020 08 26 - application was changed to fleet by Balena
::

:: - BALENA_FLEET
:: and no spaces in the name
::
SET BALENA_FLEET=

:: get the name of the folder in an environment variable
:: https://superuser.com/questions/160702/get-current-folder-name-by-a-dos-command
:: http://www.robvanderwoude.com/ntfor.php
::
IF "%BALENA_FLEET%"=="" (
	CD ..\..
	FOR %%I IN (.) DO SET BALENA_FLEET=%%~nxI
)

:: remove spaces in name
:: http://www.dostips.com/DtTipsStringManipulation.php
:: 
SET BALENA_FLEET=%BALENA_FLEET: =%
SET BALENA_APPLICATION=%BALENA_FLEET%

:: Convert extension to lowercase
:: http://www.robvanderwoude.com/battech_convertcase.php
::
::FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "extension=%%extension:%%~i%%")

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO %ERROR_MESSAGE%
::timeout /T 5
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT
ECHO [INFO ] Balena Fleet: %BALENA_FLEET% ...
ECHO.
ECHO [INFO ] For backwards compatibility
ECHO [INFO ] Balena Application: %BALENA_APPLICATION% ...
ECHO.
::timeout /T 5
EXIT /B 0
