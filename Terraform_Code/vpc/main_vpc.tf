# Create VPC
resource "aws_vpc" "vpc-wordpress" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name        = "vpc-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# Create internet gateway
resource "aws_internet_gateway" "igw-wordpress" {
  vpc_id = aws_vpc.vpc-wordpress.id

  tags = {
    Name        = "igw-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# Create pub subnets 
resource "aws_subnet" "sub-pub-01" {
  vpc_id                  = aws_vpc.vpc-wordpress.id
  cidr_block              = var.cidr_block_sub_pub_01
  availability_zone       = var.availability_zone_sub_pub_01
  map_public_ip_on_launch = true

  tags = {
    Name        = "sub-pub-01-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

resource "aws_subnet" "sub-pub-02" {
  vpc_id                  = aws_vpc.vpc-wordpress.id
  cidr_block              = var.cidr_block_sub_pub_02
  availability_zone       = var.availability_zone_sub_pub_02
  map_public_ip_on_launch = true

  tags = {
    Name        = "sub-pub-02-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# Create private subnets 
resource "aws_subnet" "sub-prv-01" {
  vpc_id                  = aws_vpc.vpc-wordpress.id
  cidr_block              = var.cidr_block_sub_prv_01
  availability_zone       = var.availability_zone_sub_prv_01
  map_public_ip_on_launch = true

  tags = {
    Name        = "sub-prv-01-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

resource "aws_subnet" "sub-prv-02" {
  vpc_id                  = aws_vpc.vpc-wordpress.id
  cidr_block              = var.cidr_block_sub_prv_02
  availability_zone       = var.availability_zone_sub_prv_02
  map_public_ip_on_launch = true

  tags = {
    Name        = "sub-prv-02-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# Create Security Group for instances in Public Subnets
resource "aws_security_group" "sg-wordpres" {
  name        = "sg_wordpress"
  description = "sg_wordpress"
  vpc_id      = aws_vpc.vpc-wordpress.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0 # SSH
    to_port     = 0 # HTTP
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all traffic"
  }
  tags = {
    Name        = "sg-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# Create route table
resource "aws_route_table" "rt-wordpress-pub" {
  vpc_id = aws_vpc.vpc-wordpress.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-wordpress.id
  }

  tags = {
    Name        = "rg-wordpress"
    created     = var.tag_created
    environment = var.tag_environment
  }
}

# route table association
resource "aws_route_table_association" "rt-sub-pub-01" {
  subnet_id      = aws_subnet.sub-pub-01.id
  route_table_id = aws_route_table.rt-wordpress-pub.id
}

resource "aws_route_table_association" "rt-sub-pub-02" {
  subnet_id      = aws_subnet.sub-pub-02.id
  route_table_id = aws_route_table.rt-wordpress-pub.id
}