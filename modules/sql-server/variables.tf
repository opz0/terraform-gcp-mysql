variable "google_sql_database_instance_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "database_version" {
  type        = string
  default     = "SQLSERVER_2019_STANDARD"
  description = ""
}

variable "project_id" {
  type        = string
  default     = ""
  description = ""
}

variable "region" {
  type        = string
  description = ""
}

variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-custom-2-13312"
}

variable "activation_policy" {
  description = "The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  default     = "ALWAYS"
}

variable "disk_size" {
  description = "The disk size for the master instance."
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}
variable "day" {
  type        = number
  default     = 1
  description = "The dat for the master instance."
}

variable "hour" {
  type        = number
  default     = 4
  description = "The hour for the master instance."
}

variable "update_track" {
  type        = string
  default     = "stable"
  description = ""
}
variable "availability_type" {
  description = "The availability type for the master instance.This is only used to set up high availability for the MSSQL instance. Can be either `ZONAL` or `REGIONAL`."
  type        = string
  default     = "REGIONAL"
}

variable "ip_configuration" {
  description = "The ip configuration for the master instances."
  type = object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool

  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = null
    allocated_ip_range  = null
  }
}

variable "google_sql_database_enabled" {
  type        = bool
  default     = true
  description = ""
}

variable "root_password" {
  type    = string
  default = ""
}

variable "name" {
  type        = string
  default     = ""
  description = ""
}

variable "deletion_protection_enabled" {
  type    = bool
  default = false
}

variable "backup_configuration" {
  description = "The database backup configuration."
  type = object({
    binary_log_enabled             = bool
    enabled                        = bool
    point_in_time_recovery_enabled = bool
    start_time                     = string
    transaction_log_retention_days = number
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    binary_log_enabled             = null
    enabled                        = true
    point_in_time_recovery_enabled = null
    start_time                     = null
    transaction_log_retention_days = 1
    retained_backups               = 1
    retention_unit                 = null
  }
}