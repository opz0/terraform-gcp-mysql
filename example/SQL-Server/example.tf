provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### call for sql-server module .
#####==============================================================================
module "sql-server" {
  source            = "../../modules/sql-server/"
  region            = "asia-northeast1"
  project_id        = "opz0-397319"
  tier              = "db-custom-2-13312"
  activation_policy = "ALWAYS"
  name              = "sql-server-db"
  disk_size         = 10
  disk_type         = "PD_SSD"
  day               = 1
  hour              = 4
  update_track      = "stable"
  availability_type = "REGIONAL"
  ip_configuration = {
    ipv4_enabled        = true
    require_ssl         = null
    private_network     = null
    authorized_networks = var.authorized_networks

  }
   root_password = var.root_password
}