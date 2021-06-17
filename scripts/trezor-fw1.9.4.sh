#!/bin/bash

# Ask for private generated signing keys
echo What\'s the 1st private key \(SECEXP\) you want to sign the firmware with?
read -p '1st Private key (SECEXP): ' FIRST_PRIVATE_KEY
echo What\'s the 2nd private key \(SECEXP\) you want to sign the firmware with?
read -p '2nd Private key (SECEXP): ' SECOND_PRIVATE_KEY
echo What\'s the 3rd private key \(SECEXP\) you want to sign the firmware with?
read -p '3rd Private key (SECEXP): ' THIRD_PRIVATE_KEY

# Pull source code down and checkout to target firmware version tag
git clone  https://github.com/trezor/trezor-firmware && \
cd trezor-firmware/legacy/
git checkout legacy/v1.9.4 && \
# Swap official SatoshiLabs signing keys to private generated keys
sed -i 's/04d571b7f148c5e4232c3814f777d8faeaf1a84216c78d569b71041ffc768a5b2d810fc3bb134dd026b57e65005275aedef43e155f48fc11a32ec790a93312bd58/048d6cda8b38bb2cd68ccc1421df793b7b4da2703343a4ddd00b4bbfa70f2e4f1c998ed1add195f95ba9d77485a9ec70eb5978ea8296c78dc0243d0ada8d723b9b/g' bootloader/firmware_sign.py
sed -i 's/0463279c0c0866e50c05c799d32bd6bab0188b6de06536d1109d2ed9ce76cb335c490e55aee10cc901215132e853097d5432eda06b792073bd7740c94ce4516cb1/04f3892e5059eb060d53e86d4068861bcbce6170b9ef9240b4cc7bf478694b0a0cf645361ac014f4cf5b0fd47b35f0c8df8891558656e5dc94494fb648df565038/g' bootloader/firmware_sign.py
sed -i 's/0443aedbb6f7e71c563f8ed2ef64ec9981482519e7ef4f4aa98b27854e8c49126d4956d300ab45fdc34cd26bc8710de0a31dbdf6de7435fd0b492be70ac75fde58/04f82acbff578411d04ca4b52bdc9695264851683de6bb2f7249109eb0449eb8e6b56f6d514a1dcd6b3aa509d89325b1d55505ad0d319466760ebe9d0d7dd84c7e/g' bootloader/firmware_sign.py
sed -i 's/\\x04\\xd5\\x71\\xb7\\xf1\\x48\\xc5\\xe4\\x23\\x2c\\x38\\x14\\xf7\\x77\\xd8\\xfa\\xea\\xf1\\xa8\\x42\\x16\\xc7\\x8d\\x56\\x9b\\x71\\x04\\x1f\\xfc\\x76\\x8a\\x5b\\x2d\\x81\\x0f\\xc3\\xbb\\x13\\x4d\\xd0\\x26\\xb5\\x7e\\x65\\x00\\x52\\x75\\xae\\xde\\xf4\\x3e\\x15\\x5f\\x48\\xfc\\x11\\xa3\\x2e\\xc7\\x90\\xa9\\x33\\x12\\xbd\\x58/\\x04\\x8d\\x6c\\xda\\x8b\\x38\\xbb\\x2c\\xd6\\x8c\\xcc\\x14\\x21\\xdf\\x79\\x3b\\x7b\\x4d\\xa2\\x70\\x33\\x43\\xa4\\xdd\\xd0\\x0b\\x4b\\xbf\\xa7\\x0f\\x2e\\x4f\\x1c\\x99\\x8e\\xd1\\xad\\xd1\\x95\\xf9\\x5b\\xa9\\xd7\\x74\\x85\\xa9\\xec\\x70\\xeb\\x59\\x78\\xea\\x82\\x96\\xc7\\x8d\\xc0\\x24\\x3d\\x0a\\xda\\x8d\\x72\\x3b\\x9b/g' bootloader/signatures.c
sed -i 's/\\x04\\x63\\x27\\x9c\\x0c\\x08\\x66\\xe5\\x0c\\x05\\xc7\\x99\\xd3\\x2b\\xd6\\xba\\xb0\\x18\\x8b\\x6d\\xe0\\x65\\x36\\xd1\\x10\\x9d\\x2e\\xd9\\xce\\x76\\xcb\\x33\\x5c\\x49\\x0e\\x55\\xae\\xe1\\x0c\\xc9\\x01\\x21\\x51\\x32\\xe8\\x53\\x09\\x7d\\x54\\x32\\xed\\xa0\\x6b\\x79\\x20\\x73\\xbd\\x77\\x40\\xc9\\x4c\\xe4\\x51\\x6c\\xb1/\\x04\\xf3\\x89\\x2e\\x50\\x59\\xeb\\x06\\x0d\\x53\\xe8\\x6d\\x40\\x68\\x86\\x1b\\xcb\\xce\\x61\\x70\\xb9\\xef\\x92\\x40\\xb4\\xcc\\x7b\\xf4\\x78\\x69\\x4b\\x0a\\x0c\\xf6\\x45\\x36\\x1a\\xc0\\x14\\xf4\\xcf\\x5b\\x0f\\xd4\\x7b\\x35\\xf0\\xc8\\xdf\\x88\\x91\\x55\\x86\\x56\\xe5\\xdc\\x94\\x49\\x4f\\xb6\\x48\\xdf\\x56\\x50\\x38/g' bootloader/signatures.c
sed -i 's/\\x04\\x43\\xae\\xdb\\xb6\\xf7\\xe7\\x1c\\x56\\x3f\\x8e\\xd2\\xef\\x64\\xec\\x99\\x81\\x48\\x25\\x19\\xe7\\xef\\x4f\\x4a\\xa9\\x8b\\x27\\x85\\x4e\\x8c\\x49\\x12\\x6d\\x49\\x56\\xd3\\x00\\xab\\x45\\xfd\\xc3\\x4c\\xd2\\x6b\\xc8\\x71\\x0d\\xe0\\xa3\\x1d\\xbd\\xf6\\xde\\x74\\x35\\xfd\\x0b\\x49\\x2b\\xe7\\x0a\\xc7\\x5f\\xde\\x58/\\x04\\xf8\\x2a\\xcb\\xff\\x57\\x84\\x11\\xd0\\x4c\\xa4\\xb5\\x2b\\xdc\\x96\\x95\\x26\\x48\\x51\\x68\\x3d\\xe6\\xbb\\x2f\\x72\\x49\\x10\\x9e\\xb0\\x44\\x9e\\xb8\\xe6\\xb5\\x6f\\x6d\\x51\\x4a\\x1d\\xcd\\x6b\\x3a\\xa5\\x09\\xd8\\x93\\x25\\xb1\\xd5\\x55\\x05\\xad\\x0d\\x31\\x94\\x66\\x76\\x0e\\xbe\\x9d\\x0d\\x7d\\xd8\\x4c\\x7e/g' bootloader/signatures.c
# Prepare the environment, disable MEMORY PROTECT, and compile
git submodule update --init --recursive && \
make -C vendor/libopencm3 lib/stm32/f2 && \
export MEMORY_PROTECT=0
export PYTHON=python3
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
make && \
# FOR BOOTLOADER COMPILE
#make -C bootloader/ align && \
# FOR FIRMWARE COMPILE
make -C vendor/nanopb/generator/proto/ && \
make -C firmware/protob/ && \
make -C firmware/ sign && \
# Sign firmware with private generated keys
bootloader/firmware_sign.py -f ./firmware/trezor.bin -s <<EOF
1
$FIRST_PRIVATE_KEY
EOF
bootloader/firmware_sign.py -f ./firmware/trezor.bin -s <<EOF
2
$SECOND_PRIVATE_KEY
EOF
bootloader/firmware_sign.py -f ./firmware/trezor.bin -s <<EOF
3
$THIRD_PRIVATE_KEY
EOF