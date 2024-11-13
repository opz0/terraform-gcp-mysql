variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "vpc_network" {
  type        = string
  description = "Name of the VPC network to peer."
}

variable "address" {
  type        = string
  default     = ""
  description = "First IP address of the IP range to allocate to CLoud SQL instances and other Private Service Access services. If not set, GCP will pick a valid one for you."
}

variable "description" {
  type        = string
  default     = ""
  description = "An optional description of the Global Address resource."
}

variable "prefix_length" {
  type        = number
  default     = 16
  description = "Prefix length of the IP range reserved for Cloud SQL instances and other Private Service Access services. Defaults to /16."
}

variable "ip_version" {
  type        = string
  default     = ""
  description = "IP Version for the allocation. Can be IPV4 or IPV6."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the IP range allocated to the peered network."
}

variable "deletion_policy" {
  type        = string
  default     = null
  description = "The deletion policy for the service networking connection. Setting to ABANDON allows the resource to be abandoned rather than deleted. This will enable a successful terraform destroy when destroying CloudSQL instances. Use with care as it can lead to dangling resources."
}