#!/bin/bash

# Variables
acrname='myacrmlt20240813'
resourceGroup="acdnd-c4-project"
clusterName="udacity-cluster"

# Deploy the application. Run the command below from the parent directory where the *azure-vote-all-in-one-redis.yaml* file is present. 
kubectl apply -f azure-vote-all-in-one-redis.yaml
kubectl set image deployment azure-vote-front azure-vote-front=$acrname.azurecr.io/azure-vote-front:v1
# Test the application at the External IP
# It will take a few minutes to come alive. 
kubectl get service
# Check the status of each node
kubectl get pods
# Push your local changes to the remote Github repo, preferably in the Deploy_to_AKS branch