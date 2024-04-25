#!/bin/bash

# This script creates an Azure Resource Group and an Azure Container Registry.

# Exit on any error
set -e

# Variables for resource names and configuration
env="shared"
webname="fibonacci"
resourceGroupName="rg-${webname}-${env}"
location="australiaeast"
acrName="acr${webname}${env}"  

# Display starting message
echo "Starting deployment of shared resources..."

# Create a resource group
echo "Creating resource group: $resourceGroupName in $location..."
az group create --name "$resourceGroupName" --location "$location"

# Create Azure Container Registry with admin user enabled
echo "Creating Azure Container Registry: $acrName in resource group $resourceGroupName..."
az acr create --resource-group "$resourceGroupName" --name "$acrName" --sku Basic --admin-enabled true --location "$location"

# Final success message
echo "Shared resources created successfully."
