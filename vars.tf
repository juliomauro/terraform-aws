# Nro de instancias
variable "qtd" {
  default = 1
}

# get subnet random
resource "random_shuffle" "subnets" {
  input = ["subnet-e64e49ad", "subnet-e64e49ad"]
  result_count = 1
}

# VPC ID
# CENTOS 7: ami-d5bf2caa
# AMAZON LINUX: ami-14c5486b
# AMAZON LINUX 2: ami-afd15ed0
# Ubuntu 16.04: ami-a4dc46db
variable "vpc_id" {
  default= "vpc-22fc1f59"
}

# AMI ID - template service
variable "ami" {
  default = "ami-803042ff"
}

# Key pair name
variable "key_pair" {
  default = "jmauro-usa"
}

# SSH user - 
variable "user" {
  default = "ec2-user"
}

# Instance type
variable "instance_type" {
  default = "t2.small"
}

# Type - to compose hostname
variable "type" {
  default = "compute"
}

# environment - to compose hostname
variable "environment" {
  default = "dr"
}

# Enable SSH on security
variable "allow_ssh" {
  default = true
}

# Enable HTTP on security
variable "allow_http" {
  default = false
}

# set public IP on instance
variable "public_ip" {
  default = true
}

# set public eIP on instance
variable "attach_eip" {
  default = false
}

# set region
variable "region" {
  default = "us-east-1"
}

# only tag
variable "backup" {
  default = "yes"
}

# set ipa user
variable "user-ipa" {
  default = "iac.terraform"
}

# set ipa password
variable "password-ipa" {
  default = "12qwaszx"
}

# set instance name / hostname
variable "hostname" {
  default = "VM_HOSTNAME"
}

# variables to set hostname
variable "business_unit" {
  default = "VM_BU"
}

variable "java_version" {
  default = "VM_JAVA_VERSION"
}

variable "product" {
  default = "VM_PRODUCT"
}
# variables to set hostname
variable "domain" {
  default = "VM_DOMAIN"
}
# variables to set hostname

variable "zone" {
  default = "VM_ZONE"
}

# variables to set hostname
variable "country" {
  default = "VM_COUNTRY"
}
