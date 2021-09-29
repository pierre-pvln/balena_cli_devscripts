ECHO [INFO ] Setting environment variables for services ...
:: https://www.balena.io/docs/reference/balena-cli/#envs

:: for all services
CALL "C:\Program Files\balena-cli\bin\balena" env add UDP_PORT 65432 -f %BALENA_ORGANIZATION%/%BALENA_FLEET%

:: for service MQTT-publisher 
CALL "C:\Program Files\balena-cli\bin\balena" env add SEND_TO_MQTT_BROKER False -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "C:\Program Files\balena-cli\bin\balena" env add UDP_HOST AIS-dispatcher -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "C:\Program Files\balena-cli\bin\balena" env add AWS_BASIC_INGEST_RULE addRawCombinedAISmessage -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher
CALL "C:\Program Files\balena-cli\bin\balena" env add verbose false -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-publisher

:: for service MQTT-Neacon 
CALL "C:\Program Files\balena-cli\bin\balena" env add SEND_TO_MQTT_BROKER True -f %BALENA_ORGANIZATION%/%BALENA_FLEET% --service MQTT-Neacon
