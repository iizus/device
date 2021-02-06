#/usr/local/bin/fish

DOCKER_MACHINE_ENV_NAME=$1

open -a XQuartz
docker-machine start $DOCKER_MACHINE_ENV_NAME
eval $(docker-machine env $DOCKER_MACHINE_ENV_NAME)

docker run --rm -it -e DISPLAY=$IP:0 gns3/xeyes