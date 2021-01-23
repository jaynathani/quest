resource "aws_autoscaling_group" "quest_asg" {
  max_size = 3
  min_size = 0
  launch_configuration = aws_launch_configuration.quest_app_launch_config.name
  vpc_zone_identifier = var.subnets
}

resource "aws_launch_configuration" "quest_app_launch_config" {
  image_id = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
}
