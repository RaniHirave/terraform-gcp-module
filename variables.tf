variable "project" {
    default = "devops-practice-252409"
}
variable "env" {
    default = "dev"
}
variable "company" { 
    default = "cglx"
}

# variable "credentials" {

# }

variable "private_subnet" {
	default = "172.16.0.0/24"
}

variable "public_subnet" {
	default = "172.16.1.0/24"
}

variable "subnet_region" {
  default = "us-west1"
}

variable "source_ranges" {
  type = "list"
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  default = ["114.143.52.206/32"]
}

variable "target_tags" {
  type = "list"
  description = "A list of target tags for this firewall"
  default = ["allow-ssh"]
}

variable "protocol" {
  description = "The name of the protocol to allow. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp), or the IP protocol number, or all"
  default = "tcp"
}

variable "ports" {
  type = "list"
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  default = ["20-80", "8080", "1000-2000"]
}

variable region {
  default = "us-west1"
}

variable zone {
  default = "us-west1-a"
}

variable subnetwork {
  default = ""
}
variable "machine_type" {
  default = "f1-micro"
}
variable "image" {
  default = "centos-7-v20180129"
}
variable "ssh-keys" {
  default = ""
}

