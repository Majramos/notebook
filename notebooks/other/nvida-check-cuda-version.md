---
title: check CUDA version
description: check for cuda version in wsl2 and using docker containers
tags:
  - docker
  - cuda
  - nvida
---

# How to check for CUDA version

## Check the highest CUDA version the installed driver supports

``` bash
nvidia-smi
```
Using docker
``` bash
docker run -it --gpus=all --rm nvidia/cuda:11.7.1-base-ubuntu20.04 nvidia-smi
```
docker version 4.17.1 has a bug with --gpus=all

## The actual CUDA version installed

```bash
$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Tue_May__3_19:00:59_Pacific_Daylight_Time_2022
Cuda compilation tools, release 11.7, V11.7.64
Build cuda_11.7.r11.7/compiler.31294372_0
```

Using docker requires CUDA image **devel**opment version
```bash
docker run -it --gpus=all --rm nvidia/cuda:11.7.1-devel-ubuntu20.04 nvcc --version
```

## Install nvidia stuff in WSL2
(nvidia oficial documentation)[https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker]

add nvidia repos
```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

update apt after adding nvidia repos
```bash
sudo apt-get update
```

install nvidia container toolkit for nvcc
```bash
sudo apt-get install -y nvidia-container-toolkit
```


## Work with nvidia-smi

continuous log stuff[1](https://enterprise-support.nvidia.com/s/article/Useful-nvidia-smi-Queries-2)
--format=csv is mandatory
```bash
nvidia-smi --query-gpu=timestamp,name,temperature.gpu,utilization.gpu,utilization.memory --format=csv -l 2
```
