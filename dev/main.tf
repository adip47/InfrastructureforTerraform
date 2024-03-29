
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
 
/*module "s3" {
  source = "../../AWSforTerraform/S3"
  env_name = "dev"
}
module "sns" {
  source = "../../AWSforTerraform/SNS"
  env_name = "dev"
}
module "sqs" {
  source = "../../AWSforTerraform/SQS"
  env_name = "dev"
}*/
 
module "vpc2" {
source = "../../AWSforTerraform/vpc2"
env_name = var.env_name
public_subnet_cidrs = var.public_subnet_cidrs
private_subnet_cidrs = var.private_subnet_cidrs
azs = var.azs
}
module "ecp" {
source = "../../AWSforTerraform/ecp"
}
