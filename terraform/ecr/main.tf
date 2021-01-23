resource "aws_ecr_repository" "quest_ecr" {
  name = var.ecr_repository_name
  image_scanning_configuration {
    scan_on_push = true
  }
}

//resource "aws_ecr_repository_policy" can also be added and attached to the above repository for restrictive access to
//the repository
