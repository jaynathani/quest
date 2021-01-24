resource "aws_s3_bucket" "quest_logs" {
  bucket        = var.log_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_policy" "quest_logs_bucket_policy" {
  bucket = aws_s3_bucket.quest_logs.id
  policy = <<POLICY
{
  "Id": "Policy1611422761623",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1611422749391",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.quest_logs.arn}/*",
      "Principal": "*"
    }
  ]
}
POLICY
}
