resource "aws_security_group" "quest_sg" {
  name = var.lb_security_group_name
  description = "Allowing SSH, 80, 443, 3000 access to CIDR"
  ingress {
    description = "SSH connection"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = var.cidr
  }

  ingress {
    description = "HTTP Port access"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = var.cidr
  }

  ingress {
    description = "HTTPS Port access"
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = var.cidr
  }

  ingress {
    description = "Port 3000 access"
    from_port = 3000
    protocol = "tcp"
    to_port = 3000
    cidr_blocks = var.cidr
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}