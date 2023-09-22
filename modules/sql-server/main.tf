provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}
locals {
  retained_backups = lookup(var.backup_configuration, "retained_backups", null)
  retention_unit   = lookup(var.backup_configuration, "retention_unit", null)
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_user" "users" {
  name     = var.name
  instance = google_sql_database_instance.example_instance[0].name
   password = var.root_password
}

#####==============================================================================
##### Create a GCP SQL Server instance
#####==============================================================================
resource "google_sql_database_instance" "example_instance" {
  count               = var.google_sql_database_instance_enabled ? 1 : 0
  name                = var.name
  database_version    = var.database_version
  root_password       = var.root_password
  project             = var.project_id
  deletion_protection = false

  region = var.region

  settings {
    tier              = var.tier
    activation_policy = var.activation_policy
    disk_size         = var.disk_size
    disk_type         = var.disk_type
    dynamic "backup_configuration" {
      for_each = {
        "example" = var.backup_configuration != null ? var.backup_configuration : {
          default_key = "default_value"
        }
      }
      content {
        binary_log_enabled             = lookup(backup_configuration.value, "binary_log_enabled", null)
        enabled                        = lookup(backup_configuration.value, "enabled", null)
        start_time                     = lookup(backup_configuration.value, "start_time", null)
        point_in_time_recovery_enabled = lookup(backup_configuration.value, "point_in_time_recovery_enabled", null)
        transaction_log_retention_days = lookup(backup_configuration.value, "transaction_log_retention_days", null)

        dynamic "backup_retention_settings" {
          for_each = local.retained_backups != null || local.retention_unit != null ? [var.backup_configuration] : []
          content {
            retained_backups = local.retained_backups
            retention_unit   = local.retention_unit

        }
        }
      }
    }
    maintenance_window {
      day          = var.day
      hour         = var.hour
      update_track = var.update_track
    }
    deletion_protection_enabled = false
    availability_type           = var.availability_type
    ip_configuration {
      ipv4_enabled    = true
      private_network = null
      require_ssl     = null
    }
  }
}
#####==============================================================================
##### Create a GCP SQL Server database
#####==============================================================================
resource "google_sql_database" "example_database" {
  count    = var.google_sql_database_enabled ? 1 : 0
  name     = var.name
  instance = google_sql_database_instance.example_instance[0].name
}