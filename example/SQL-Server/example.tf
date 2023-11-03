provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### sql-server module call.
#####==============================================================================
module "mssql" {
  source                  = "../../modules/sql-server"
  name                    = "sql"
  environment             = "server-db"
  random_instance_name    = true
  user_password           = "foobar"
  deletion_protection     = false
  sql_server_audit_config = var.sql_server_audit_config
}