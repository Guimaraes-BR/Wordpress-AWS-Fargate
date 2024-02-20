module "vpc" {
  source = "./vpc"

  cidr_block_vpc               = var.cidr_block_vpc
  cidr_block_sub_pub_01        = var.cidr_block_sub_pub_01
  cidr_block_sub_pub_02        = var.cidr_block_sub_pub_02
  cidr_block_sub_prv_01        = var.cidr_block_sub_prv_01
  cidr_block_sub_prv_02        = var.cidr_block_sub_prv_02
  availability_zone_sub_pub_01 = var.availability_zone_sub_pub_01
  availability_zone_sub_pub_02 = var.availability_zone_sub_pub_02
  availability_zone_sub_prv_01 = var.availability_zone_sub_prv_01
  availability_zone_sub_prv_02 = var.availability_zone_sub_prv_02
  tag_environment              = var.tag_environment
  tag_created                  = var.tag_created

}

module "ecr" {
  source = "./ecr"
  # ECR
  ecr_name       = var.ecr_name
  ecr_mutability = var.ecr_mutability

}

module "ecs" {
  source = "./ecs"
  # ECS
  cluster_name = var.cluster_name

}