#!/bin/bash -e

# instructions for installing k8s are at
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
if true
then
	version=$(curl --silent --location "https://dl.k8s.io/release/stable.txt")
	echo "installing latest version ${version}"
else
	version="v1.26.7"
	echo "installing hardcoded version ${version}"
fi
folder="${HOME}/install/binaries"
mkdir -p "${folder}"
executable="${folder}/kubectl"
curl --location --silent --output "${executable}" "https://dl.k8s.io/release/${version}/bin/linux/amd64/kubectl"
chmod +x "${executable}"
