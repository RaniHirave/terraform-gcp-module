Module Project IAM
    This optional module is used to assign project roles

Inputs
    Name	        Description	Type	                                                        Default     	Required
    bindings	    Map of role (key) and list of members (value) 
                    to add the IAM policies/bindings	                                        map(list(string))	n/a	yes
    bindings_num	Number of bindings, in case using dependencies of other resources' outputs 
                    number	                                                                        "0"	             no
    mode	        Mode for adding the IAM policies/bindings, additive and authoritative	       string	"additive"	no
    project	        Project to add the IAM policies/bindings	                                   string	""	no
    projects	    Projects list to add the IAM policies/bindings list(string)	                   <list>	    no
    projects_num	Number of projects, in case using dependencies of other resources' outputs	
                    number	                                                                        "0"	        no

Outputs
    Name	    Description
    members	    Members which were bound to projects.
    projects	Projects wich received bindings.
    roles	    Roles which were assigned to members.