Terraform Google Cloud NAT Module
    This module handles opinionated Google Cloud Platform Cloud NAT creation and configuration.

Inputs
    Name                                                                type    default     required
    network	Name of the network this set of firewall rules applies to.	string	    n/a	    yes
    project_id	Project id of the project that holds the network.	    string	    n/a	    yes
    router	(Required) The name of the router in which this NAT will be string      n/a     yes
    configured. Changing this forces a new NAT to be created.	

Outputs
    Name	                Description
    name	                Name of the Cloud NAT
    nat_ip_allocate_option	NAT IP allocation mode
    region	                Cloud NAT region
    router_name	            Cloud NAT router name