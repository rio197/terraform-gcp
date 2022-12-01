provider "google" {
    region= var.region
    zone= var.zone
    project= var.project_name
    credentials= var.credentials_file_path
}

resource "google_compute_instance" "default" {
    name = "terraform-instance"
    machine_type = var.machine_type

    boot_disk {
        initialize_params {
          image = "debian-cloud/debian-10"
        }
    }

    # Install nginx
    metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; sudo service nginx restart"

    network_interface {
      network = "default"

      access_config {
        # Include this section to give the VM an external IP address
      }
    }
}
