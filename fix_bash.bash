#!/bin/bash -e

echo "PATH=\"${HOME}/install/binaries:${PATH}\"" >> ~/.bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc
echo "source <(minikube completion bash)" >> ~/.bashrc
