::
:: @name:     ais_daysi_hat.cmd
:: @purpose:  set environment variables for usage with daysi hat
::
:: @version   v0.0.6  2021-12-15
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
::

ECHO.
ECHO [INFO ] Setting environment variables for disabling bluetooth and enabling uart on CM4 IO board ...
:: https://www.balena.io/docs/reference/balena-cli/#envs
:: set environment variables for usage with AIS dAISy HAT rpi
:: Disable bluetooth serial
CALL "%BALENA_CLI%" env add BALENA_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"disable-bt\"" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "%BALENA_CLI%" env add RESIN_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"disable-bt\"" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
:: Enable uart 
CALL "%BALENA_CLI%" env add BALENA_HOST_CONFIG_enable_uart "1" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "%BALENA_CLI%" env add RESIN_HOST_CONFIG_enable_uart "1" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
