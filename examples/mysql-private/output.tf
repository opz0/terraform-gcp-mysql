output "name" {
  description = "The name for Cloud SQL instance"
  value       = module.mysql-private.name
}

output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The outputs of the created VPC."
}

output "mysql_user_pass" {
  sensitive   = true
  value       = module.mysql-private.generated_user_password
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
}

output "reserved_range_name" {
  value       = module.private-service-access.google_compute_global_address_name
  description = "The Global Address resource name"
}

output "reserved_range_address" {
  value       = module.private-service-access.address
  description = "The Global Address resource name"
}

output "public_ip_address" {
  value       = module.mysql-private.public_ip_address
  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
}

output "private_ip_address" {
  value       = module.mysql-private.private_ip_address
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
}