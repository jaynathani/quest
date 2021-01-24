output "ecr_url" {
  value = module.ecr.ecr_url
}

output "ecr_id" {
  value = module.ecr.ecr_id
}

output "s3_bucket_id" {
  value = module.s3.logs_bucket_id
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_service_id" {
  value = module.ecs.ecs_service_id
}

output "ecs_task_definition_id" {
  value = module.ecs.ecs_task_definition_id
}

output "ecs_security_group_id" {
  value = module.ecs.ecs_security_group_id
}
