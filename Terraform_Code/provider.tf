terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

  }

  backend "s3" {
    bucket = "backendterraformguimaraes"
    key    = "backendterraform/terraform.tfstate"
    region = "us-west-2"
  }

}
/*
provider "aws" {
  region = "us-west-2"
}
*/
