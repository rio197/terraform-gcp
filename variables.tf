variable "region" {
    default = "northamerica-northeast1"
}

variable "zone" {
    default = "northamerica-northeast1-a"
}

variable "project_name" {
    description = "The ID of the Google Cloud project"
    default = "learn-terraform"
}

variable "credentials_file_path" {
    description = "Path to the JSON file used to describe your account credentials"
    default = "~/sa-terraform.json"
    sensitive = true
}

variable "machine_type" {
    default = "f1-micro"
}
