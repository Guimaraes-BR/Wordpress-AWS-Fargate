# VPC
variable "cidr_block_vpc" {
  description = "cidr_block_VPC"
  type        = string
}

# subnet pública
variable "cidr_block_sub_pub_01" {
  description = "cidr_block sub-pub-01"
  type        = string
}

variable "availability_zone_sub_pub_01" {
  description = "availability_zone_sub_pub_01"
  type        = string
}

variable "cidr_block_sub_pub_02" {
  description = "cidr_block sub-pub-02"
  type        = string
}

variable "availability_zone_sub_pub_02" {
  description = "availability_zone_sub_pub_02"
  type        = string
}

# subnet privada
variable "cidr_block_sub_prv_01" {
  description = "cidr_block sub-prv-01"
  type        = string
}

variable "availability_zone_sub_prv_01" {
  description = "availability_zone_sub_prv_01"
  type        = string
}

variable "cidr_block_sub_prv_02" {
  description = "cidr_block sub-prv-02"
  type        = string
}

variable "availability_zone_sub_prv_02" {
  description = "availability_zone_sub_prv_02"
  type        = string
}

# tags
variable "tag_environment" {
  description = "Tag Environment"
  type        = string
}

variable "tag_created" {
  description = "Tag Created"
  type        = string
}