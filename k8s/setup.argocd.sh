#!/bin/sh

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Optional
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
