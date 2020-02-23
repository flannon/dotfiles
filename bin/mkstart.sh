#!/bin/bash

minikube start \
  --network-plugin=cni \
  --enable-default-cni \
  --extra-config=kubelet.container-runtime=remote \
  --extra-config=kubelet.container-runtime-endpoint=/var/run/crio.sock \
  --extra-config=kubelet.image-service-endpoint=/var/run/crio.sock \
  --bootstrapper=kubeadm
