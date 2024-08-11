#!/bin/bash

# Variables
resourceGroup="acdnd-c4-project"
location="westus"
osType="Ubuntu2204"
vmssName="udacity-vmss"
adminName="udacityadmin"
storageAccount="udacitydiag18720"
bePoolName="$vmssName-bepool"
lbName="$vmssName-lb"
lbRule="$lbName-network-rule"
nsgName="$vmssName-nsg"
vnetName="$vmssName-vnet"
subnetName="$vnetName-subnet"
probeName="tcpProbe"
vmSize="Standard_B1s"
storageType="Standard_LRS"

# Go to Load Balancer/ rules/ delete the rule Rule

# Create Network Load Balancer Rule
echo "STEP 6 - Creating network load balancer rule $lbRule"

az network lb rule create \
  --resource-group $resourceGroup \
  --name $lbRule \
  --lb-name $lbName \
  --probe-name $probeName \
  --backend-pool-name $bePoolName \
  --backend-port 80 \
  --frontend-ip-name loadBalancerFrontEnd \
  --frontend-port 22 \
  --protocol tcp \
  --verbose

echo "Network load balancer rule created: $lbRule"


