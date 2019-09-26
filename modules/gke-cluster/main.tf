
# Creates a Google Kubernetes Engine (GKE) cluster
resource "google_container_cluster" "cluster" {
  project                  = "${var.project}"
  name                     = "${var.network}-gke"
  location                 = "${var.location}"
  remove_default_node_pool = true

  node_pool {
    name = "default-pool"
  }
}
# Manages a Node Pool resource within GKE
resource "google_container_node_pool" "gke-node-pool" {
  project    = "${var.project}"
  name       = "gke-node-pool"
  cluster    = "${google_container_cluster.cluster.name}"
  location   = "${var.location}"
  node_count = "2"

  node_config {
    machine_type = "${var.machine_type}"
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

