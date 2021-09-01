::
:: @name:     balena_organization.cmd
:: @purpose:  set the organization name as an environment variable
::
:: @version   v0.0.3  2021-08-26
:: @author:   pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
:: @revision: 2018 07 16 - initial version:: Revision: 2021 06 30 - initial version

:: - BALENA_ORGANIZATION
:: no spaces in the name
::
SET BALENA_ORGANIZATION=

:: get the name of the folder in an environment variable
:: https://superuser.com/questions/160702/get-current-folder-name-by-a-dos-command
:: http://www.robvanderwoude.com/ntfor.php
::
IF "%BALENA_ORGANIZATION%"=="" (
	CD ..\..\..
	FOR %%I IN (.) DO SET BALENA_ORGANIZATION=%%~nxI
)

:: remove spaces in name
:: http://www.dostips.com/DtTipsStringManipulation.php
:: 
SET BALENA_ORGANIZATION=%BALENA_ORGANIZATION: =%

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
ECHO [INFO ] Balena Organization: %BALENA_ORGANIZATION% ...
ECHO.
::timeout /T 5
EXIT /B 0
