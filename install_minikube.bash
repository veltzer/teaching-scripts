#!/bin/bash -e
# https://minikube.sigs.k8s.io/docs/start/
# version="1.32.0"
folder="${HOME}/install/binaries"
mkdir -p "${folder}"
executable="${folder}/minikube"
curl --location --silent --output "${executable}" "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
# curl --location --silent --output "${executable}" "https://storage.googleapis.com/minikube/releases/${version}/minikube-linux-amd64"
chmod +x "${executable}"
