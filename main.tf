terraform {
   backend "local" {
       path     = "../../state/terraform.tfstate"
}
}
 
provider "aws" {
    region = "us-east-1"
}
 
terraform {
   required_providers {
   aws = "~>2.34"
}
}
 
variable "path"  { default = "../state/terraform.tfstate" }
variable "region" {
    default = "us-east-1"
}
 
variable "env" {
  default = "dev"
}
 
module "s3" {
  source = "" [please put s3 repo url here ]
  env_name = "dev"
}
has context menu
Wale, Kanchan is typing
