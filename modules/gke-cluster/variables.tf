variable network {
}
variable subnetwork {
}
variable "machine_type" {
}
variable "location" {
}
variable "project" {
}
variable "node_pool" {
  type        = "list"
  default     = []
  description = "Node pool setting to create"
}