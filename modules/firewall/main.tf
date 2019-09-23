resource "google_compute_firewall" "allow-ssh" {
  project = "${var.project}"
  name    = "allow-${var.name}"
  network = "${var.network}"
  source_ranges = ["114.143.52.206/32"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["20-80", "8080", "1000-2000"]
  }

}