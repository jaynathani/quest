resource "aws_ecr_repository" "quest_ecr" {
  name = var.ecr_repository_name
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "null_resource" "push_local_docker_image_to_ecr" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password | docker login --username AWS --password-stdin ${aws_ecr_repository.quest_ecr.repository_url}"
  }

  provisioner "local-exec" {
    command = "docker tag ${var.local_docker_image_id} ${aws_ecr_repository.quest_ecr.repository_url}:${var.docker_image_version}"
  }

  provisioner "local-exec" {
    command = "docjer push ${aws_ecr_repository.quest_ecr.repository_url}:${var.docker_image_version}"
  }
}

//resource "null_resource" "tag_local_docker_image_to_ecr" {
//  provisioner "local-exec" {
//    command = "docker tag ${var.local_docker_image_id} ${aws_ecr_repository.quest_ecr.repository_url}:${var.docker_image_version}"
//  }
//}
//
//resource "null_resource" "push_local_docker_image_to_ecr" {
//  provisioner "local-exec" {
//    command = "docjer push ${aws_ecr_repository.quest_ecr.repository_url}:${var.docker_image_version}"
//  }
//}

//resource "aws_ecr_repository_policy" can also be added and attached to the above repository for restrictive access to
//the repository
