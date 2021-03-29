#!/bin/bash

docker -v
if [ $? -eq 0 ]; then
    echo "docker is available"
else
    echo "The program 'docker' is currently not installed."
	sudo apt-get update -y		&&
	sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg \
		lsb-release		&&
	sudo apt install docker.io -y		&&
	sudo systemctl start docker	&&
	sudo systemctl start docker	&&
	docker --version
fi