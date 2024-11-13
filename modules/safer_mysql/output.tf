output "name" {
  value       = module.safer_mysql.name
  description = "The instance name for the master instance"
}

output "ip_address" {
  value       = module.safer_mysql.ip_address
  description = "The IPv4 addesses assigned for the master instance"
}

output "private_ip_address" {
  value       = module.safer_mysql.private_ip_address
  description = "The private IP address assigned for the master instance"
}

output "public_ip_address" {
  value       = join("", module.safer_mysql[*].public_ip_address)
  description = "The public IP address assigned for the master instance"
}

output "first_ip_address" {
  value       = module.safer_mysql.first_ip_address
  description = "The first IPv4 address of the addresses assigned."
}

output "connection_name" {
  value       = module.safer_mysql.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "self_link" {
  value       = module.safer_mysql.self_link
  description = "The URI of the master instance"
}

output "server_ca_cert" {
  value       = module.safer_mysql.server_ca_cert
  description = "The CA certificate information used to connect to the SQL instance via SSL"
}

output "service_account_email_address" {
  value       = module.safer_mysql.service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "generated_user_password" {
  value       = module.safer_mysql.generated_user_password
  description = "The auto generated default user password if not input password was provided"
  sensitive   = true
}

output "additional_users" {
  value = [for r in module.safer_mysql.additional_users :
    {
      name     = r.name
      password = r.password
    }
  ]
  description = "List of maps of additional users and passwords"
  sensitive   = true
}

output "root_password" {
  value       = module.safer_mysql.root_password
  description = "MSSERVER password for the root user. If not set, a random one will be generated and available in the root_password output variable."
  sensitive   = true
}

output "primary" {
  value       = module.safer_mysql.primary
  description = "The `google_sql_database_instance` resource representing the primary instance"
  sensitive   = true
}