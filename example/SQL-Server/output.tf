output "connection_name" {
  value = module.sql-server.connection_name
}

output "id" {
  value = module.sql-server.id
}

output "self_link" {
  value = module.sql-server.self_link
}

output "root_password" {
  value     = module.sql-server.root_password
  sensitive = true
}