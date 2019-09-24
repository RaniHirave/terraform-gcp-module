Google Cloud Simple VPC Firewall Creation
    This module allows creation of a minimal VPC firewall, supporting basic configurable rules for IP range-based intra-VPC and administrator ingress, and tag-based SSH, HTTP, and HTTPS ingress.

    The HTTP and HTTPS rules use the same network tags network tags that are assigned to instances when flaggging the "Allow HTTP[S] traffic" checkbox in the Cloud Console. The SSH rule uses a generic ssh tag.

    All IP source ranges are configurable through variables, and are set by default to 0.0.0.0/0 for tag-based rules. Allowed protocols and/or ports for the intra-VPC rule are also configurable through a variable.

The resources created/managed by this module are:
    one optional ingress rule from internal CIDR ranges, only allowing ICMP by default
    one optional ingress rule from admin CIDR ranges, allowing all protocols on all ports
    one optional ingress rule for SSH on network tag ssh
    one optional ingress rule for HTTP on network tag http-server
    one optional ingress rule for HTTPS on network tag https-server

Inputs
    Name                                                                type    default     required
    network	Name of the network this set of firewall rules applies to.	string	    n/a	    yes
    project_id	Project id of the project that holds the network.	    string	    n/a	    yes
