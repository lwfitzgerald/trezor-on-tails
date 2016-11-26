#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    echo 'This script must be run as root. Please rerun using sudo.'
    exit 1
fi

apt-get update
apt-get install -y --no-install-recommends \
	python-pip python-dev build-essential libusb-1.0-0-dev libudev-dev
torify pip install -U setuptools
torify pip install trezor==0.6.13
chmod -R ugo+rX /usr/local/lib/python2.7/dist-packages
torify curl -sL https://raw.githubusercontent.com/trezor/trezor-common/master/udev/51-trezor.rules > /lib/udev/rules.d/51-trezor.rules
chmod 644 /lib/udev/rules.d/51-trezor.rules

