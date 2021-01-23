module "ecr" {
  source = "./ecr"
  ecr_repository_name = "test-repo"
}

module "s3" {
  source = "./s3"
}

module "ec2" {
  source = "./ec2"
  s3_logs_bucket = module.s3.logs_bucket_id
  ssl_cert_body_file_path = "../../public.pem"
  ssl_cert_private_file_path = "../../private.pem"
  subnets = ["subnet-f11d9697", "subnet-a2e77683"]
  vpc_id = "vpc-c67ed9bb"
}
