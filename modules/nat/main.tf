resource "google_compute_router" "vpc_router" {
  name = "${var.network}-router"
  project = "${var.project}"
  region  = "${var.region}"
  network = "${var.network}"
}

resource "google_compute_router_nat" "vpc_nat" {
  name = "${var.network}-nat"
  project = "${var.project}"
  region  = "${var.region}"
  router  = "${google_compute_router.vpc_router.name}"

  nat_ip_allocate_option = "AUTO_ONLY"

  # "Manually" define the subnetworks for which the NAT is used, so that we can exclude the public subnetwork
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = "${var.subnetwork}"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
