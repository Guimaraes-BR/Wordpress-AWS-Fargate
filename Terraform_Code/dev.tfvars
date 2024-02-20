# VPC
cidr_block_vpc               = "10.10.0.0/16"
cidr_block_sub_pub_01        = "10.10.1.0/24"
cidr_block_sub_pub_02        = "10.10.2.0/24"
cidr_block_sub_prv_01        = "10.10.3.0/24"
cidr_block_sub_prv_02        = "10.10.4.0/24"
availability_zone_sub_pub_01 = "us-west-2a"
availability_zone_sub_pub_02 = "us-west-2b"
availability_zone_sub_prv_01 = "us-west-2a"
availability_zone_sub_prv_02 = "us-west-2b"
tag_environment              = "development"
tag_created                  = "terraform"

# ECR
ecr_name       = "wordpress_dev"
ecr_mutability = "IMMUTABLE"

# ECS
cluster_name = "wordpres_dev_cluster"