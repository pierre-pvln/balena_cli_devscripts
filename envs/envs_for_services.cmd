::
:: @name:     envs_for_services.cmd
:: @purpose:  set environment variables for services
::
:: @version   v0.0.6  2021-12-15
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
::

ECHO.
ECHO [INFO ] Setting environment variables for services ...
:: https://www.balena.io/docs/reference/balena-cli/#envs

:: for all services
CALL "%BALENA_CLI%" env add UDP_PORT 65432 -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "%BALENA_CLI%" env add USB_TTY_PORT ttyACM0 -f %BALENA_ORGANIZATION%/%BALENA_FLEET%

:: for service MQTT-publisher 
CALL "%BALENA_CLI%" env add SEND_TO_MQTT_BROKER False -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "%BALENA_CLI%" env add UDP_HOST AIS-dispatcher -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "%BALENA_CLI%" env add AWS_BASIC_INGEST_RULE addRawCombinedAISmessage -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "%BALENA_CLI%" env add verbose false -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher

:: for service MQTT-Neacon 
CALL "%BALENA_CLI%" env add SEND_TO_MQTT_BROKER True -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-Neacon
