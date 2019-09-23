terraform {
  required_version = ">= 0.10.3"
}

provider "google" {
  credentials = "${file("CREDENTIALS_FILE.json")}"
}
module "vpc" {
  project = "${var.project}"
  source = "./modules/vpc" 
  env    = "${var.env}"
  company = "${var.company}"
  network_name = "${format("%s","${var.company}-${var.env}-vpc")}"
  routing_mode = "GLOBAL"
  public_subnet_name = "${format("%s","${var.company}-${var.env}-vpc-public-subnet")}"
  private_subnet_name = "${format("%s","${var.company}-${var.env}-vpc-private-subnet")}"

    subnets = [
        {
            subnet_name           = "${format("%s","${var.company}-${var.env}-vpc-public-subnet")}"
            subnet_ip             = "${var.public_subnet}"
            subnet_region         = "${var.subnet_region}"
        },
        {
            subnet_name           = "${format("%s","${var.company}-${var.env}-vpc-private-subnet")}"
            subnet_ip             = "${var.private_subnet}"
            subnet_region         = "${var.subnet_region}"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        }
    ]

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
        {
            name                   = "app-proxy"
            description            = "route through proxy to reach app"
            destination_range      = "172.50.1.0/24"
            tags                   = "app-proxy"
            next_hop_internet      = "true"
            next_hop_instance_zone = "us-west1-a"
        }
    ]
}
module "allow-ssh" {
  project = "${var.project}"
  source = "./modules/firewall"
  name = "ssh-rule"
  network = module.vpc.network_name
  protocol = "${var.protocol}"
  ports = "${var.ports}"
  source_ranges = "${var.source_ranges}"
  target_tags = "${var.target_tags}"
}

module "nat" {
  project = "${var.project}"
  source = "./modules/nat"
  region = "${var.region}"
  zone = "${var.zone}"
  network = module.vpc.network_name
  subnetwork = module.vpc.public_subnet_name
}

module "instance" {
  project = "${var.project}"
  source = "./modules/instance"
  zone = "${var.zone}"
  network = module.vpc.network_name
  subnetwork = module.vpc.private_subnet_name
  machine_type = "${var.machine_type}"
  image = "${var.image}"
  ssh-keys = "rhirave:${file("~/.ssh/id_rsa.pub")}"
}