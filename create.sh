#/bin/zsh

# https://github.com/gzupark/boot2docker-webcam-mac/blob/master/README.md


DOCKER_MACHINE_ENV_NAME=$1
BOOT2DOCKER=https://github.com/gzupark/boot2docker-webcam-mac/releases/download/18.06.1-ce-usb/boot2docker.iso


docker-machine create \
    -d virtualbox \
	--virtualbox-cpu-count=2 \
	--virtualbox-memory=2048 \
	--virtualbox-disk-size=100000 \
	--virtualbox-boot2docker-url $BOOT2DOCKER \
	$DOCKER_MACHINE_ENV_NAME

docker-machine stop $DOCKER_MACHINE_ENV_NAME


vboxmanage modifyvm $DOCKER_MACHINE_ENV_NAME --vram 128
vboxmanage modifyvm $DOCKER_MACHINE_ENV_NAME --accelerate3d on

vboxmanage modifyvm $DOCKER_MACHINE_ENV_NAME --usb on
vboxmanage modifyvm $DOCKER_MACHINE_ENV_NAME --usbxhci on


# docker-machine start $DOCKER_MACHINE_ENV_NAME