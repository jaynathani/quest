output "alb_target_grp_http_arn" {
  value = aws_lb_target_group.quest_lb_target_group_http.arn
}

output "lb_sg_id" {
  value = aws_security_group.quest_sg.id
}

output "iam_ssl_certificate_id" {
  value = aws_iam_server_certificate.quest_elb_ssl_cert.id
}

output "lb_id" {
  value = aws_lb.quest_elb.id
}
