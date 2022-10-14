# Create a single Compute Engine instance
resource "google_compute_instance" "desafio-vpc" {
  name         = "desafio-vpc"
  machine_type = var.machine_type
  zone         = "us-central1-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id
    network = google_compute_network.vpc_network.id
  }
}