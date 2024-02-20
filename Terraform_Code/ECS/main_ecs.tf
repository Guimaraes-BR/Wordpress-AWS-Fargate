# create cluster
resource "aws_ecs_cluster" "wordpress_cluster" {
  name = var.cluster_name
}

# Create capacity provider
resource "aws_ecs_cluster_capacity_providers" "fargate_capacity" {
  cluster_name = aws_ecs_cluster.wordpress_cluster.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

# Create a Task definition
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "task_wordpress"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256" # 0.5 vCPU (1 vCPU = 1024 CPU units)
  memory                   = "512" # 2 GB

  execution_role_arn = "your_execution_role_arn" # Replace with your ECS execution role ARN

  container_definitions = jsonencode([
    {
      name  = "your_container_name"
      image = "your_container_image_uri"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}
