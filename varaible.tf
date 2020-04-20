varaible.tf
+++++++++++++
varaible "aws_region" {
 description = "Region for the VPC"
 default = "us-east-1"
 }

varaible "vpc_cidr" {
 description = "CIDR for the VPC"
 default = "10.0.0.0/16"
 }

varaible "public_subnet_cidr" {
 description = "CIDR for public subnet"
 default = "10.0.1.0/24"
 }


varaible "private_subnet_cidr" {
 description = "CIDR for private subnet"
 default = "10.0.2.0/24
 }
 
variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/core/.ssh/id_rsa.pub"
}
