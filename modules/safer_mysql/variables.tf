variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "random_instance_name" {
  type        = bool
  default     = false
  description = "Sets random suffix at the end of the Cloud SQL resource name"
}

variable "database_version" {
  type        = string
  description = "The database version to use"
}

variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
}

variable "vpc_network" {
  type        = string
  description = "Existing VPC network to which instances are connected. The networks needs to be configured with https://cloud.google.com/vpc/docs/configure-private-services-access."
}

variable "allocated_ip_range" {
  type        = string
  default     = null
  description = "Existing allocated IP range name for the Private IP CloudSQL instance. The networks needs to be configured with https://cloud.google.com/vpc/docs/configure-private-services-access."
}

variable "tier" {
  type        = string
  default     = ""
  description = "The tier for the master instance."
}

variable "edition" {
  type        = string
  default     = null
  description = "The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS."
}

variable "zone" {
  type        = string
  default     = null
  description = "The zone for the master instance, it should be something like: `a`, `c`."
}

variable "secondary_zone" {
  type        = string
  default     = null
  description = "The preferred zone for the secondary/failover instance, it should be something like: `us-central1-a`, `us-east1-c`."
}

variable "follow_gae_application" {
  type        = string
  default     = null
  description = "A Google App Engine application whose zone to remain in. Must be in the same region as this instance."
}

variable "activation_policy" {
  type        = string
  default     = "ALWAYS"
  description = "The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
}

variable "availability_type" {
  type        = string
  default     = "REGIONAL"
  description = "The availability type for the master instance. Can be either `REGIONAL` or `null`."
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "Enables protection of an instance from accidental deletion across all surfaces (API, gcloud, Cloud Console and Terraform)."
}

variable "disk_autoresize" {
  type        = bool
  default     = true
  description = "Configuration to increase storage size"
}

variable "disk_autoresize_limit" {
  type        = number
  default     = 0
  description = "The maximum size to which storage can be auto increased."
}

variable "disk_size" {
  type        = number
  default     = 10
  description = "The disk size for the master instance"
}

variable "disk_type" {
  type        = string
  default     = "PD_SSD"
  description = "The disk type for the master instance."
}

variable "pricing_plan" {
  type        = string
  default     = "PER_USE"
  description = "The pricing plan for the master instance."
}

variable "maintenance_window_day" {
  type        = number
  default     = 1
  description = "The day of week (1-7) for the master instance maintenance."
}

variable "maintenance_window_hour" {
  type        = number
  default     = 23
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
}

variable "maintenance_window_update_track" {
  type        = string
  default     = "stable"
  description = "The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`."
}

variable "data_cache_enabled" {
  type        = bool
  default     = false
  description = "Whether data cache is enabled for the instance. Defaults to false. Feature is only available for ENTERPRISE_PLUS tier and supported database_versions"
}

variable "deny_maintenance_period" {
  type = list(object({
    end_date   = string
    start_date = string
    time       = string
  }))
  default     = []
  description = "The Deny Maintenance Period fields to prevent automatic maintenance from occurring during a 90-day time period. List accepts only one value. See [more details](https://cloud.google.com/sql/docs/mysql/maintenance)"
}

variable "database_flags" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/mysql/flags)"
}

variable "user_labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the master instances."
}

variable "assign_public_ip" {
  type        = bool
  default     = false
  description = "Set to true if the master instance should also have a public IP (less secure)."
}

variable "db_name" {
  type        = string
  default     = "default"
  description = "The name of the default database to create"
}

variable "db_charset" {
  type        = string
  default     = ""
  description = "The charset for the default database"
}

variable "db_collation" {
  type        = string
  default     = ""
  description = "The collation for the default database. Example: 'utf8_general_ci'"
}

variable "additional_databases" {
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default     = []
  description = "A list of databases to be created in your cluster"
}

variable "user_name" {
  type        = string
  default     = "default"
  description = "The name of the default user"
}

variable "user_password" {
  type        = string
  default     = ""
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
}

variable "additional_users" {
  type = list(object({
    name            = string
    password        = string
    host            = string
    type            = string
    random_password = bool
  }))
  default     = []
  description = "A list of users to be created in your cluster. A random password would be set for the user if the `random_password` variable is set."
}

variable "iam_users" {
  type = list(object({
    id    = string,
    email = string,
    type  = optional(string)
  }))
  default     = []
  description = "A list of IAM users to be created in your CloudSQL instance. iam.users.type can be CLOUD_IAM_USER, CLOUD_IAM_SERVICE_ACCOUNT, CLOUD_IAM_GROUP and is required for type CLOUD_IAM_GROUP (IAM groups)"
}

variable "create_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timout that is applied to limit long database creates."
}

variable "update_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timout that is applied to limit long database updates."
}

variable "delete_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timout that is applied to limit long database deletes."
}

variable "module_depends_on" {
  type        = list(any)
  default     = []
  description = "List of modules or resources this module depends on."
}

variable "deletion_protection" {
  type        = bool
  default     = true
  description = "Used to block Terraform from deleting a SQL Instance."
}

variable "encryption_key_name" {
  type        = string
  default     = null
  description = "The full path to the encryption key used for the CMEK disk encryption"
}

variable "insights_config" {
  type = object({
    query_plans_per_minute  = number
    query_string_length     = number
    record_application_tags = bool
    record_client_address   = bool
  })
  default     = null
  description = "The insights_config settings for the database."
}