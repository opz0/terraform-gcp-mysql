# terraform-gcp-mysql
# Google Cloud Infrastructure Provisioning with Terraform
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create MYSQL .
## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example: mysql
```hcl
module "mysql-db" {
  source               = "git::https://github.com/opz0/terraform-gcp-mysql.git?ref=v1.0.0"
  name                 = "test"
  environment          = "mysql-db"
  random_instance_name = true
  database_version     = "MySQL_8_0"
  zone                 = "asia-northeast1-a"
  region               = "asia-northeast1"
  tier                 = "db-n1-standard-1"
  host                 = "%"
  deletion_protection  = false

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = false
    allocated_ip_range  = null
    authorized_networks = var.authorized_networks
  }
  database_flags = [
    {
      name  = "log_bin_trust_function_creators"
      value = "on"
    },
  ]
}
```
This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs

- 'name'  : The name of the mysql-db.
- 'environment': The environment type.
- 'project_id' : The GCP project ID.
- 'region': The region the instance will sit in.
- 'database_version': The MySQL version to use.
- 'zone' : The preferred compute engine zone.
- 'tier' : The machine type to use.
- 'host' : The host the user can connect from.
- 'deletion_protection' :  Whether or not to allow Terraform to destroy the instance.

## Module Outputs
Each module may have specific outputs. You can retrieve these outputs by referencing the module in your Terraform configuration.

- 'name' : The name for Cloud mysql instance.
- 'connection_name' :The connection name of the master instance to be used in connection strings.
- 'mysql_user_pass': The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable.
- 'public_ip_address' : The first public (PRIMARY) IPv4 address assigned for the master instance.
- 'private_ip_address': The first private (PRIVATE) IPv4 address assigned for the master instance.

## Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/opz0/terraform-gcp-mysql.git/blob/master/LICENSE) file for details.
