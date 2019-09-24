output "source_ranges" {
  value = google_compute_firewall.allow-ssh.source_ranges
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
}

output "target_tags" {
  value = google_compute_firewall.allow-ssh.target_tags
  description = "A list of target tags for this firewall"
}

