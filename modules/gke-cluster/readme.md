# GKE Cluster Module
The GKE Cluster module is used to administer the cluster master for a [Google Kubernetes Engine (GKE) Cluster]
The cluster master is the "control plane" of the cluster; for example, it runs
the Kubernetes API used by `kubectl`. Worker machines are configured by attaching to the cluster module.

## What is a GKE Cluster?

The GKE Cluster, or "cluster master", runs the Kubernetes control plane
processes including the Kubernetes API server, scheduler, and core resource
controllers.

The master is the unified endpoint for your cluster; it's the "hub" through
which all other components such as nodes interact. Users can interact with the
cluster via Kubernetes API calls, such as by using `kubectl`. The GKE cluster
is responsible for running workloads on nodes, as well as scaling/upgrading
nodes.

## How do I attach worker machines using a GKE node pool?
Node pools also control the autoscaling of their nodes, and autoscaling
configuration is done inline, alongside the node config definition. A GKE
Cluster can have multiple node pools defined.
Node pools are configured directly with the
Terraform resource by providing a reference to the cluster you configured with
this module as the `cluster` field.

## What VPC network will this cluster use?
You must explicitly specify the network and subnetwork of your GKE cluster using
the `network` and `subnetwork` fields; 

## What is a VPC-native cluster?
A VPC-native cluster is a GKE Cluster that uses [alias IP ranges], in that
it allocates IP addresses from a block known to GCP. When using an alias range, pod addresses are natively routable
within GCP, and VPC networks can ensure that the IP range the cluster uses is reserved.

## What is a private cluster?
In a private cluster, the nodes have internal IP addresses only, which ensures that their workloads are isolated from the public Internet. 
Private nodes do not have outbound Internet access, but Private Google Access provides private nodes and their workloads with 
limited outbound access to Google Cloud Platform APIs and services over Google's private network.
You can create a private cluster by setting `enable_private_nodes` to `true`. Note that with a private cluster, setting
the master CIDR range with `master_ipv4_cidr_block` is also required.

### How do I control access to the cluster master?
In a private cluster, the master has two endpoints:
* **Private endpoint:** 
This is the internal IP address of the master, behind an internal load balancer in the master's 
VPC network. Nodes communicate with the master using the private endpoint. Any VM in your VPC network, and in the same 
region as your private cluster, can use the private endpoint.

* **Public endpoint:** '
This is the external IP address of the master. You can disable access to the public endpoint by setting
`enable_private_endpoint` to `true`.

