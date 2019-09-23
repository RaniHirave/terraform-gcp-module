resource "google_compute_network" "vpc" {
  project                 = "${var.project}"
  provider                = "google"
  name                    = "${var.network_name}"
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}


/******************************************
	Shared VPC
 *****************************************/
resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
  count      = var.shared_vpc_host == "true" ? 1 : 0
  project    = var.project
  depends_on = [google_compute_network.vpc]
}

/******************************************
	Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "subnetwork" {
  count = length(var.subnets)

  name                     = var.subnets[count.index]["subnet_name"]
  ip_cidr_range            = var.subnets[count.index]["subnet_ip"]
  region                   = var.subnets[count.index]["subnet_region"]
  private_ip_google_access = lookup(var.subnets[count.index], "subnet_private_access", "false")
  enable_flow_logs         = lookup(var.subnets[count.index], "subnet_flow_logs", "false")
  network                  = google_compute_network.vpc.name
  project                  = var.project
  description              = lookup(var.subnets[count.index], "description", null)
}

/******************************************
	Routes
 *****************************************/
resource "google_compute_route" "route" {
  count                  = length(var.routes)
  project                = "${var.project}"
  network                = "${var.network_name}"
  name                   = "${lookup(var.routes[count.index], "name", format("%s-%s-%d", lower(var.network_name), "route", count.index))}"
  description            = "${lookup(var.routes[count.index], "description", "")}"
  tags                   = compact(split(",", lookup(var.routes[count.index], "tags", "")))
  dest_range             = lookup(var.routes[count.index], "destination_range", "")
  next_hop_gateway       = lookup(var.routes[count.index], "next_hop_internet", "") == "true" ? "default-internet-gateway" : ""
  next_hop_ip            = lookup(var.routes[count.index], "next_hop_ip", "")
  next_hop_instance      = lookup(var.routes[count.index], "next_hop_instance", "")
  next_hop_instance_zone = lookup(var.routes[count.index], "next_hop_instance_zone", "")
  next_hop_vpn_tunnel    = lookup(var.routes[count.index], "next_hop_vpn_tunnel", "")
  priority               = lookup(var.routes[count.index], "priority", "1000")

  depends_on = [
    google_compute_network.vpc,
    google_compute_subnetwork.subnetwork,
  ]
}