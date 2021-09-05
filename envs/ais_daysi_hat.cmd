ECHO [INFO ] Setting environment variables for disabling bluetooth and enabling uart on CM4 IO board ...
:: https://www.balena.io/docs/reference/balena-cli/#envs
:: set environment variables for usage with AIS dAISy HAT rpi
:: Disable bluetooth serial
CALL "C:\Program Files\balena-cli\bin\balena" env add BALENA_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"disable-bt\"" --fleet %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "C:\Program Files\balena-cli\bin\balena" env add RESIN_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"disable-bt\"" --fleet %BALENA_ORGANIZATION%/%BALENA_FLEET%
:: Enable uart 
CALL "C:\Program Files\balena-cli\bin\balena" env add BALENA_HOST_CONFIG_enable_uart "1" --fleet %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "C:\Program Files\balena-cli\bin\balena" env add RESIN_HOST_CONFIG_enable_uart "1" --fleet %BALENA_ORGANIZATION%/%BALENA_FLEET%
