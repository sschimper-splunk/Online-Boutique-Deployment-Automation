#!/bin/bash

# install dependencies
sudo snap install docker
sudo chmod 777 /var/run/docker.sock
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

sudo snap install kubectl --classic
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && sudo install skaffold /usr/local/bin/

# start cluster
minikube start --cpus=4 --memory 4096 --disk-size 32g --vm-driver=docker

# deploy app
git clone https://github.com/GoogleCloudPlatform/microservices-demo.git
cd microservices-demo
skaffold run

echo "Finished"