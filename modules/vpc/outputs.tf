output "network_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}

output "public_subnet_name" {
  value       = google_compute_subnetwork.subnetwork[0].self_link
  description = "The name of the VPC being created"
}

output "private_subnet_name" {
  value       = google_compute_subnetwork.subnetwork[1].self_link
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.vpc.self_link
  description = "The URI of the VPC being created"
}

output "subnets_names" {
  value       = google_compute_subnetwork.subnetwork.*.name
  description = "The names of the subnets being created"
}

output "subnets_ips" {
  value       = google_compute_subnetwork.subnetwork.*.ip_cidr_range
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnets_self_links" {
  value       = google_compute_subnetwork.subnetwork.*.self_link
  description = "The self-links of subnets being created"
}

output "subnets_regions" {
  value       = google_compute_subnetwork.subnetwork.*.region
  description = "The region where the subnets will be created"
}

output "subnets_private_access" {
  value       = google_compute_subnetwork.subnetwork.*.private_ip_google_access
  description = "Whether the subnets will have access to Google API's without a public IP"
}


output "routes" {
  value       = google_compute_route.route.*.name
  description = "The routes associated with this VPC"
}