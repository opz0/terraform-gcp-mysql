data "google_client_config" "current" {
}

resource "google_compute_global_address" "google-managed-services-range" {
  project       = data.google_client_config.current.project
  name          = "${var.name}-${var.vpc_network}"
  description   = var.description
  purpose       = "VPC_PEERING"
  address       = var.address
  prefix_length = var.prefix_length
  ip_version    = var.ip_version
  labels        = var.labels
  address_type  = "INTERNAL"
  network       = var.vpc_network
}

resource "google_service_networking_connection" "private_service_access" {
  network                 = var.vpc_network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.google-managed-services-range.name]
  deletion_policy         = var.deletion_policy
}

resource "null_resource" "dependency_setter" {
  depends_on = [google_service_networking_connection.private_service_access]
}