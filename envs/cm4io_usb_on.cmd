::
:: @name:     cm4io_usb_on.cmd
:: @purpose:  set environment variables for enabling USB on CM4 io board
::
:: @version   v0.0.6  2021-12-15
:: @author    pierre@ipheion.eu
:: @copyright (C) 2020-2021 Pierre Veelen
::

ECHO.
ECHO [INFO ] Setting environment variables for enabling USB on CM4 IO board ...
:: https://www.balena.io/docs/reference/balena-cli/#envs
:: https://forums.balena.io/t/cm4-sierra-em7345-modem/328468/5
:: https://forums.balena.io/t/balena-cm4-io-board-image-usb-support/338550/3
:: set environment variables for usage with cm4 io board
:: enable USB
CALL "%BALENA_CLI%" env add BALENA_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"dwc2,dr_mode=host\"" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
CALL "%BALENA_CLI%" env add RESIN_HOST_CONFIG_dtoverlay "\"vc4-fkms-v3d\", \"dwc2,dr_mode=host\"" -f %BALENA_ORGANIZATION%/%BALENA_FLEET%
