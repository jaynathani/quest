resource "aws_iam_server_certificate" "quest_elb_ssl_cert" {
  name = var.ssl_cert_name
  certificate_body = file(var.ssl_cert_body_file_path)
  private_key = file(var.ssl_cert_private_file_path)
}

resource "aws_lb" "quest_elb" {
  name = var.lb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.quest_sg.id]
  subnets = var.subnets

  access_logs {
    bucket = var.s3_logs_bucket
    enabled = true
  }
}

resource "aws_lb_target_group" "quest_lb_target_group_https" {
  name = var.lb_target_grp_name
  port = 443
  protocol = "HTTPS"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group" "quest_lb_target_group_http" {
  name = "quest-http-target-grp"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "quest_lb_listener" {
  load_balancer_arn = aws_lb.quest_elb.arn
  port = 443
  protocol = "HTTPS"
  certificate_arn = aws_iam_server_certificate.quest_elb_ssl_cert.arn
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.quest_lb_target_group_https.arn
  }
}

resource "aws_lb_listener" "quest_lb_listener_http" {
  load_balancer_arn = aws_lb.quest_elb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.quest_lb_target_group_http.arn
  }
}
