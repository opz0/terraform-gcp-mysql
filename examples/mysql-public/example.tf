provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### mysql-db module call.
#####==============================================================================
module "mysql-public" {
  source               = "./../../"
  name                 = "test"
  user_name            = "mysql"
  db_name              = "testdb"
  environment          = "mysql"
  user_password        = "hKMLf65R"
  database_version     = "MYSQL_5_6"
  zone                 = "asia-northeast1-a"
  region               = "asia-northeast1"
  tier                 = "db-n1-standard-1"
  host                 = "%"
  deletion_protection  = false
  random_instance_name = true

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    ssl_mode            = "ENCRYPTED_ONLY"
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