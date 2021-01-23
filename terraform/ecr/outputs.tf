output "ecr_url" {
  value = aws_ecr_repository.quest_ecr.repository_url
}

output "ecr_id" {
  value = aws_ecr_repository.quest_ecr.id
}
