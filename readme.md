Terraform Network Module
    This modules makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:
    ->A Google Virtual Private Network (VPC)
    ->Subnets within the VPC
    ->Routes within the vpc 

Compatibility
    ->This module is meant for use with Terraform  0.10.3. 

Then perform the following commands on the root folder:     
    ->terraform init        : to get the plugins
    ->terraform validate    : to validate the syntax of the terraform files
    ->terraform plan        : to see the infrastructure plan
    ->terraform apply       : to apply the infrastructure build
    ->terraform destroy     : to destroy the built infrastructure