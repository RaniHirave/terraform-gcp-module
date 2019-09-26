# Google Virtual Private Network (VPC) Creation
   This example configures a single simple VPC inside of a project.

## This VPC has two subnets, and two routes

## Inputs
    Name                                                                type    default     required
    network_name	The name of the VPC network being created	        string	n/a	        yes
    project_id	    The project ID to host the network in	            string	n/a	        yes

## Outputs
    Name	                Description
    network_name	        The name of the VPC being created
    network_self_link	    The URI of the VPC being created
    routes	                The routes associated with this VPC
    subnets_flow_logs	    Whether the subnets will have VPC flow logs enabled
    subnets_ips	            The IP and cidrs of the subnets being created
    subnets_names	        The names of the subnets being created
    subnets_private_access	Whether the subnets will have access to Google API's without a public IP
    subnets_regions	        The region where subnets will be created
