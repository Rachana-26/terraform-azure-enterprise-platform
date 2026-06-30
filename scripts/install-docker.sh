#!/bin/bash

apt-get update -y

apt-get install docker.io -y

systemctl enable docker

systemctl start docker

docker --version