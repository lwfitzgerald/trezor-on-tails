# trezor-on-tails
Installation guide for using your Trezor with Electrum on Tails.

Tested on Tails 2.7

## :warning: Privacy warning :warning:
[myTREZOR](https://mytrezor.com) and [Electrum](https://electrum.org) are thin clients. This means that when you connect your Trezor they fetch the balances of your addresses by transmitting them to a remote server. As you cannot trust the logging behaviour of these remote servers:

**If you have used your Trezor outside of Tails, it is likely any generated addresses have been associated with your IP address**.

For this reason it is recommended to:
  1. Enable [Passphrase encryption](#enable-passphrase-encryption) on your Trezor
  2. Choose a unique password you will only use for privacy sensitive transactions
  3. Only use this password when you are using your Trezor on Tails.

## Set up
  1. When Tails Greeter appears, choose "Yes" for more options.
  2. Set an Administration password
  3. Open a terminal and run:

    ```
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends \
        python-pip python-dev build-essential libusb-1.0-0-dev libudev-dev
    sudo torify pip install -U setuptools
    sudo torify pip install trezor==0.6.13
    sudo chmod -R ugo+rX /usr/local/lib/python2.7/dist-packages/
    sudo sh -c 'torify curl -sL' \
        'https://raw.githubusercontent.com/trezor/trezor-common/master/udev/51-trezor.rules' \
        '> /lib/udev/rules.d/51-trezor.rules'
    sudo chmod 644 /lib/udev/rules.d/51-trezor.rules
    ```

  4. Open Electrum
  5. Select "Create a new Wallet" and "Hardware wallet"
  6. Next choose "Use a device you have already set up" and "TREZOR wallet" as the type of hardware wallet

![Duplicate devices in Electrum](https:/raw.githubusercontent.com/lwfitzgerald/trezor-on-tails/master/images/duplicates.png)
With newer firmwares Electrum may show a duplicate device and will ask you to choose. It doesn't appear to matter which you pick.

## tl;dr give me a script to run
Usual "don't curl unsolicited shell scripts into a root shell" disclaimer applies.
```
torify curl -sL https://raw.githubusercontent.com/lwfitzgerald/trezor-on-tails/master/install-trezor.sh | sudo sh
```

## Enable Passphrase encryption
### myTREZOR
![myTREZOR passphrase encryption enabling](https://raw.githubusercontent.com/lwfitzgerald/trezor-on-tails/master/images/passphrase-mytrezor.png)
  1. Got to [myTrezor](https://mytrezor.com)
  2. Click the name of your device and then switch to the "Advanced" tab
  3. Tick the OK box and click "Enable passphrase encryption"
  4. Disconnect and Reconnect your Trezor

### Electrum
![Electrum passphrase encryption enabling](https://raw.githubusercontent.com/lwfitzgerald/trezor-on-tails/master/images/passphrase-electrum.png)
  1. Click the small Trezor icon in the Electrum status bar
  2. Switch to the Advanced tab and click "Enable Passphrases"
  3. Close Electrum
  3. Disconnect and Reconnect your Trezor
  4. Restart Electrum and create a new Electrum wallet
