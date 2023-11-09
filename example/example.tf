provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### mysql-db module call.
#####==============================================================================
module "mysql-db" {
  source               = "../"
  name                 = "test"
  environment          = "mysql"
  random_instance_name = true
  database_version     = "MySQL_8_0"
  zone                 = "asia-northeast1-a"
  region               = "asia-northeast1"
  tier                 = "db-n1-standard-1"
  host                 = "%"
  deletion_protection  = false

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = false
    allocated_ip_range  = null
    authorized_networks = var.authorized_networks
  }
  database_flags = [
    {
      name  = "log_bin_trust_function_creators"
      value = "on"
    },
  ]
}