#!/bin/bash

echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

echo "Load Balancer DNS:"
terraform output nlb_dns_name
