resource "google_compute_instance" "devops-practice-vm" {
  project = "${var.project}"
  name = "${var.network}-instance"
   
  machine_type = "${var.machine_type}"
  zone = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
  network_interface {
   network = "${var.network}"
   subnetwork  = "${var.subnetwork}"
   access_config {
     // Include this section to give the VM an external ip address
   }
 }
 metadata = {
   ssh-keys = "${var.ssh-keys}"
 }
}