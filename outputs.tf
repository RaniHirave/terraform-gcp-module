output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "public_subnet_name" {
  value       = module.vpc.public_subnet_name
  description = "The name of the VPC being created"
}

output "private_subnet_name" {
  value       = module.vpc.private_subnet_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}
output "machine_type" {
  value       = module.instance.machine_type
  description = "The machine_type being created"
}
output "source_ranges" {
  value = module.allow-ssh.source_ranges
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
}

output "target_tags" {
  value = module.allow-ssh.target_tags
  description = "A list of target tags for this firewall"
}
output region {
    value = module.nat.region
    description = "A region of vpc_nat"
}
