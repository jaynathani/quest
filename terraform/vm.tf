//resource "aws_security_group" "quest_sg" {
//  name = "quest_sg"
//  description = "Allowing SSH, 80, 443, 3000 access to CIDR"
//  ingress {
//    description = "SSH connection"
//    from_port = 22
//    protocol = "tcp"
//    to_port = 22
//    cidr_blocks = [var.cidr]
//  }
//
//  ingress {
//    description = "HTTP Port access"
//    from_port = 80
//    protocol = "tcp"
//    to_port = 80
//    cidr_blocks = [var.cidr]
//  }
//
//  ingress {
//    description = "HTTPS Port access"
//    from_port = 443
//    protocol = "tcp"
//    to_port = 443
//    cidr_blocks = [var.cidr]
//  }
//
//  ingress {
//    description = "Port 3000 access"
//    from_port = 3000
//    protocol = "tcp"
//    to_port = 3000
//    cidr_blocks = [var.cidr]
//  }
//}
//
//resource "aws_instance" "test_instance" {
//  ami = "ami-0be2609ba883822ec"
//  instance_type = "t2.micro"
//  tags = {
//    Name: "test-instance"
//  }
//  security_groups = [aws_security_group.quest_sg.name]
//  key_name = "rearc-quest"
//  user_data = file("./install-script.sh")
//}
