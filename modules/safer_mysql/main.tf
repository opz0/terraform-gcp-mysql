module "safer_mysql" {
  source                          = "./../../"
  name                            = var.name
  environment                     = var.environment
  label_order                     = var.label_order
  random_instance_name            = var.random_instance_name
  database_version                = var.database_version
  region                          = var.region
  zone                            = var.zone
  secondary_zone                  = var.secondary_zone
  follow_gae_application          = var.follow_gae_application
  tier                            = var.tier
  edition                         = var.edition
  activation_policy               = var.activation_policy
  availability_type               = var.availability_type
  deletion_protection_enabled     = var.deletion_protection_enabled
  disk_autoresize                 = var.disk_autoresize
  disk_autoresize_limit           = var.disk_autoresize_limit
  disk_size                       = var.disk_size
  disk_type                       = var.disk_type
  pricing_plan                    = var.pricing_plan
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  database_flags                  = var.database_flags
  data_cache_enabled              = var.data_cache_enabled
  deny_maintenance_period         = var.deny_maintenance_period
  encryption_key_name             = var.encryption_key_name

  deletion_protection = var.deletion_protection
  user_labels         = var.user_labels
  insights_config     = var.insights_config

  ip_configuration = {
    ipv4_enabled        = var.assign_public_ip # public IP to be mediated by Cloud SQL.
    authorized_networks = []
    ssl_mode            = "ENCRYPTED_ONLY"
    private_network     = var.vpc_network
    allocated_ip_range  = var.allocated_ip_range
  }

  db_name      = var.db_name
  db_charset   = var.db_charset
  db_collation = var.db_collation

  additional_databases = var.additional_databases
  user_name            = var.user_name
  user_password        = var.user_password
  additional_users     = var.additional_users
  iam_users            = var.iam_users

  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  module_depends_on = var.module_depends_on
}