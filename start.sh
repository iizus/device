#/bin/zsh

DOCKER_MACHINE_ENV_NAME=$1

open -a XQuartz
docker-machine start $DOCKER_MACHINE_ENV_NAME
eval $(docker-machine env $DOCKER_MACHINE_ENV_NAME)
