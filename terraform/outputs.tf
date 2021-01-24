output "ecr_url" {
  value = module.ecr.ecr_url
}

output "ecr_id" {
  value = module.ecr.ecr_id
}

output "s3_bucket_id" {
  value = module.s3.logs_bucket_id
}
