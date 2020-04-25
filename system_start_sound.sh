#!/bin/bash

# This script is for /etc/rc.d/init.d
# Link in rc3.d/S99audio-greeting and rc0.d/K01audio-greeting

# play a sound upon starting and stopping your machine

case "$1" in
'start')
cat /usr/share/audio/at_your_service.au > /dev/audio
;;
'stop')
cat /usr/share/audio/oh_no_not_again.au > /dev/audio
;;
esac
exit 0
