resource "aws_ecs_cluster" "quest_ecs_cluster" {
  name = "quest_ecs_cluster"
}

resource "aws_ecs_service" "quest_ecs_service" {
  name = "quest_app"
  cluster = aws_ecs_cluster.quest_ecs_cluster.id
  task_definition = aws_ecs_task_definition.quest_ecs_td.arn
  desired_count = 3
  launch_type = "FARGATE"

  network_configuration {
    subnets = [aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id]
    assign_public_ip = true
    security_groups = [aws_security_group.quest_ecs_security_group.id]
  }

  load_balancer {
    target_group_arn = var.alb_target_grp_arn_http
    container_name = aws_ecs_task_definition.quest_ecs_td.family
    container_port = 3000
  }
}

resource "aws_ecs_task_definition" "quest_ecs_td" {
  family = "quest_ecs_task"
  container_definitions = <<EOF
[
  {
    "name": "quest_ecs_task",
    "image": "${var.ecr_url}:2",
    "environment": [
      {
        "name": "SECRET_WORD",
        "value": "${var.quest_secret_word}"
      }
    ],
    "memory": 512,
    "cpu": 256,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000,
        "protocol": "tcp"
      }
    ]
  }
]
EOF
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  memory = 512
  cpu = 256
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_default_vpc" "default_vpc" {}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = "us-east-1b"
}

resource "aws_security_group" "quest_ecs_security_group" {
  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    //Only allowing traffic in from the load balancer security group
    security_groups = [var.lb_sg_id]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}