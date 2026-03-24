#!/bin/sh

# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --namespace argocd --create-namespace

# Optional
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
