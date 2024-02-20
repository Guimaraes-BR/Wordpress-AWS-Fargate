resource "aws_ecr_repository" "ecr_wordpress" {
  name                 = var.ecr_name
  image_tag_mutability = var.ecr_mutability

  image_scanning_configuration {
    scan_on_push = false
  }
}