output "name" {
  value       = module.mysql-db.name
  description = "The name for Cloud SQL instance"
}

output "connection_name" {
  value       = module.mysql-db.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "mysql_user_pass" {
  sensitive   = true
  value       = module.mysql-db.generated_user_password
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
}

output "public_ip_address" {
  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
  value       = module.mysql-db.public_ip_address
}

output "private_ip_address" {
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
  value       = module.mysql-db.private_ip_address
}