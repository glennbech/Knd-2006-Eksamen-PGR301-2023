resource "aws_apprunner_service" "service" {
  service_name = var.service_name

  instance_configuration {
    instance_role_arn = aws_iam_role.role_for_apprunner_service.arn
    cpu = 256
    memory = 1024
  }

  source_configuration {
    authentication_configuration {
      access_role_arn = var.access_role_arn
    }
    image_repository {
      image_configuration {
        port = var.port
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
}






