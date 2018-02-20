#!/bin/bash
# This script will install all required stuff to run a Bitcoin Lightning (BLTG) Masternode.
# Bitcoin Lightning Repository : https://github.com/Bitcoinlightning/Bitcoin-Lightning
# !! THIS SCRIPT NEED TO RUN AS ROOT !!
######################################################################

clear
echo "*********** Welcome to the Bitcoin Lightning (BLTG) Masternode Setup Script ***********"
echo 'This script will update your Bitcoin Lightning wallet'
echo '****************************************************************************'
sleep 3
echo '*** Step 1/3 ***'
echo '*** Remove previous Bitcoin Lightning wallet ***'
sleep 2
cd ~/Bitcoin-Lightning/src
./Bitcoin_Lightningd stop
rm -rf Bitcoin_Lightningd
sleep 1
echo '*** Done 1/3 ***'
sleep 1
echo '*** Step 2/3 ***'
echo '*** Installing the latest wallet ***'
sleep 2
wget https://github.com/Bitcoinlightning/Bitcoin-Lightning/releases/download/v1.1.0.0/Bitcoin_Lightning-Daemon-1.1.0.0.tar.gz
tar xvzf Bitcoin_Lightning-Daemon-1.1.0.0.tar.gz
rm Bitcoin_Lightning-Daemon-1.1.0.0.tar.gz
chmod 755 Bitcoin_Lightningd
sleep 1
echo '*** Done 2/3 ***'
sleep 2
echo '*** Step 3/3 ***'
echo '*** Last Server Start also Wallet Sync ***'
echo 'After 1 minute you will see the getinfo output from the RPC Server... Make yourself a cup of coffee ;)'
./Bitcoin_Lightningd -daemon
sleep 60
./Bitcoin_Lightningd getinfo
sleep 2
echo 'Have fun with your Bitcoin Lightning Masternode!'
sleep 2
echo '*** Done 3/3 ***'
