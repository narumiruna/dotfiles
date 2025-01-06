#!/bin/bash

export CUDA_INSTALLER="cuda-repo-ubuntu1604_10.1.105-1_amd64.deb"
curl https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_INSTALLER} --output ${CUDA_INSTALLER}
sudo dpkg -i ${CUDA_INSTALLER}
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub

sudo sh -c 'echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list'

sudo apt-get update
sudo apt-get install -y cuda libcudnn7

echo 'export PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}' >> ${HOME}/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64' >> ${HOME}/.zshrc
