provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

locals {
  network_name = "test-mysql-private-safer"
}



#####==============================================================================
##### mysql-db module call.
#####==============================================================================
module "vpc" {
  source                                    = "cypik/vpc/google"
  version                                   = "1.0.3"
  name                                      = local.network_name
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  mtu                                       = 1500
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}

module "private-service-access" {
  source = "../../modules/private_service_access"

  vpc_network     = module.vpc.vpc_name
  deletion_policy = "ABANDON"
}

module "mysql-private" {
  source = "../../modules/safer_mysql"

  name                 = "test"
  environment          = "app"
  random_instance_name = true
  deletion_protection  = false
  assign_public_ip     = false

  database_version = "MYSQL_8_0"
  region           = "us-central1"
  zone             = "us-central1-c"
  tier             = "db-n1-standard-1"

  database_flags = [
    {
      name  = "cloudsql_iam_authentication"
      value = "on"
    },
  ]

  additional_users = [
    {
      name            = "app"
      password        = "PaSsWoRd"
      host            = "localhost"
      type            = "BUILT_IN"
      random_password = false
    },
    {
      name            = "readonly"
      password        = "PaSsWoRd"
      host            = "localhost"
      type            = "BUILT_IN"
      random_password = false
    },
  ]

  iam_users = [
    {
      id    = "cloudsql_mysql_sa",
      email = "example@gmail.com"
    },
    {
      id    = "dbadmin",
      email = "dbadmin@develop.blueprints.joonix.net"
    },
    {
      id    = "subtest",
      email = "subtest@develop.blueprints.joonix.net"
      type  = "CLOUD_IAM_GROUP"
    }
  ]

  vpc_network        = module.vpc.self_link
  allocated_ip_range = module.private-service-access.google_compute_global_address_name

  module_depends_on = [module.private-service-access.peering_completed]
}