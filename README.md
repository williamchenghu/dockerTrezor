# dockerTrezor
Compile private signed Trezor firmware with docker.

docker build --rm -t docker-trezor .

docker run --rm -it --name trezor-compiler docker-trezor

docker cp trezor-compiler:/root/trezor-firmware/legacy/firmware/trezor.bin ./trezor-custom-signed.bin