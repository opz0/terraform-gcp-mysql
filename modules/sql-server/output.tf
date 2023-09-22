output "connection_name" {
  value = join("", google_sql_database_instance.example_instance.*.connection_name)
}

output "id" {
  value = join("", google_sql_database_instance.example_instance.*.id)
}

output "self_link" {
  value = join("", google_sql_database_instance.example_instance.*.self_link)
}

output "root_password" {
  value     = join("", google_sql_database_instance.example_instance.*.root_password)
  sensitive = true
}