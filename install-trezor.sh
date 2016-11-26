#!/bin/bash
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
	python-pip python-dev build-essential libusb-1.0-0-dev libudev-dev
sudo torify pip install -U setuptools
sudo torify pip install trezor==0.6.13
sudo chmod -R ugo+rX /usr/local/lib/python2.7/dist-packages

