#!/bin/bash

# Variables
resourceGroup="acdnd-c4-project"
location="westus"
autoaccount="mltautoaccount"
runbookname="myrunbook"
osType="Ubuntu2204"
vmName="udacity-vm"
adminName="udacityadmin"

# echo "STEP 0 - Creating resource group $resourceGroup..."

# az group create \
# --name $resourceGroup \
# --location $location \
# --verbose

# echo "Resource group created: $resourceGroup"

echo "STEP 1 - Create automation account $autoaccount..."
az automation account create --name $autoaccount --resource-group $resourceGroup --location $location

echo "Automation account created: $autoaccount"

echo "STEP 2 - Create runbook $runbookname..."
az automation runbook create \
--resource-group $resourceGroup \
--automation-account-name $autoaccount \
--name $runbookname \
--type python3
--runbook-type python3 \
--location $location \
--description "This Runbook remedies performance issues."

echo "Runbook created: $runbookname"
