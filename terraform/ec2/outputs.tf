output "alb_target_grp_http_arn" {
  value = aws_lb_target_group.quest_lb_target_group_http.arn
}

output "alb_target_grp_https_arn" {
  value = aws_lb_target_group.quest_lb_target_group_https.arn
}

output "asg_arn" {
  value = aws_autoscaling_group.quest_asg.arn
}

output "lb_sg_id" {
  value = aws_security_group.quest_sg.id
}
