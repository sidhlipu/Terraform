# Firewall Rule Terraform Module

This repo contains reusable terraform module to submit a firewall rule.

## Using Modules

1.  To use a module from this repository, add a block like the following
    to your terraform code:
    
    ``` hcl
    module "postgreserver" {
    source = "https://bitbucket.honeywell.com/projects/HCETMR/repos/azure-postgressql/"
    azurerm_resource_group                    = "******"  
    azurerm_location                          = "east us"
    azurerm_postgreserver_username            = "******"
    azurerm_postgreserver_password            = ""******""
    }

output "postgresql_private_ip_addr" {
  value = module.postgreserver.postgresql_private_ip_addr
}
    ```

2.  Run `terraform get && terraform init && terraform plan && terraform apply` to acquire the module, init , plan and apply the module.


