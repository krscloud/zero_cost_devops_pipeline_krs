#!/usr/bin/env bash
set -e

echo "=== 1. Checking if Native K3s is installed ==="
if ! command -v k3s &> /dev/null; then
  echo "Installing lightweight single-node K3s..."
  curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik --disable local-storage" sh -
  
  # Configure user permissions for kubectl
  mkdir -p $HOME/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
  sudo chown $USER:$USER $HOME/.kube/config
else
  echo "K3s is already running natively."
fi

export KUBECONFIG=$HOME/.kube/config

echo "=== 2. Applying Manifests ==="
if [ -f k8s-app.yaml ]; then
  kubectl apply -f k8s-app.yaml
else
  echo "Error: k8s-app.yaml manifest missing!"
  exit 1
fi

echo "========================================="
echo " SUCCESS: Safe Bare-Metal Setup Applied! "
echo "========================================="
