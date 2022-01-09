# Balena CLI scripts for development
Scripts for easy updating balena configurations using balena CLI

Put empty file in folder ../containers to set balena environment variables
- cm4io_usb_on to enable USB on CM4 IO board
- ais_daysi_hat to disable bluetooth and enable UART for serial communication
- envs_for_services to set service specific environment variables

Specific settings should be set with cmd script in container definition folder.
File should have same name as fleet.
