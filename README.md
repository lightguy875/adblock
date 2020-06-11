# adblock
Adblock script for custom firmware router (dd-wrt or openwrt), tested with a dd-wrt router.

# adblock.sh
This file must be written as a start script if you choose to use it as a custom script you must change the cronjob script.

# cronjob.sh
Add the line to the cronjob options in management. It will rerun the script to update the list with a schedule time.

# dnsmasq.sh
Add the line to dnsmasq options in the script to add the new hostfile as new addresses.

