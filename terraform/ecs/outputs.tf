output "ecs_cluster_id" {
  value = aws_ecs_cluster.quest_ecs_cluster.id
}

output "ecs_service_id" {
  value = aws_ecs_service.quest_ecs_service.id
}

output "ecs_task_definition_id" {
  value = aws_ecs_task_definition.quest_ecs_td.id
}

output "ecs_security_group_id" {
  value = aws_security_group.quest_ecs_security_group.id
}
