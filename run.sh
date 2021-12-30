#!/usr/bin/env bash

set -x

export LOCATION=germanywestcentral

export RESOURCE_GROUP=AKS-PRIVATE-CLUSTER
export PRIVATE_CLUSTER_NAME=PRIVATE-CLUSTER

# set +x
# echo "################################################################################"
# echo "### create private aks cluster in Frankfurt"
# echo "################################################################################"
# set -x

az group create \
    --name ${RESOURCE_GROUP} \
    --location ${LOCATION}

az aks create \
    --resource-group ${RESOURCE_GROUP} \
    --name ${PRIVATE_CLUSTER_NAME} \
    --load-balancer-sku standard \
    --enable-private-cluster

sleep 60

az group list \
    --query [].name \
    --output table

sleep 20

az resource list \
    --location ${LOCATION} \
    --query [].name \
    --output table

sleep 20

set +x
echo "################################################################################"
echo "### get nodes and pods"
echo "################################################################################"
set -x

az aks command invoke \
    --resource-group ${RESOURCE_GROUP} \
    --name ${PRIVATE_CLUSTER_NAME} \
    --command "kubectl get nodes"

sleep 20

az aks command invoke \
    --resource-group ${RESOURCE_GROUP} \
    --name ${PRIVATE_CLUSTER_NAME} \
    --command "kubectl get pods --all-namespaces"

sleep 20

set +x
echo "################################################################################"
echo "### delete everything"
echo "################################################################################"
set -x

az aks delete \
    --resource-group ${RESOURCE_GROUP} \
    --name ${PRIVATE_CLUSTER_NAME} \
    --yes

az group delete \
    --name ${RESOURCE_GROUP} \
    --no-wait \
    --yes

sleep 20