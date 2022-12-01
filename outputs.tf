output "instance_name" {
  value = google_compute_instance.default.id
}

output "cpu_platform" {
  value = google_compute_instance.default.cpu_platform
}
