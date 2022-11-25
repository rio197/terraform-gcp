provider "google" {
    region= "northamerica-northeast1"
    zone= "northamerica-northeast1-a"
    project= "terraform-learn-???"
    credentials= "/home/???/terraform-learn-???-???.json"
}

resource "google_compute_instance" "default" {
    name = "terraform-instance"
    machine_type = "f1-micro"

    boot_disk {
        initialize_params {
          image = "debian-cloud/debian-9"
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
    
    terraform {
      backend "gcs" {
          bucket = "bucket-tfstate-terraform"
          prefix = terraform/state
      }
    }
}
