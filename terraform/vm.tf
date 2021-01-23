resource "aws_instance" "test_instance" {
  ami = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  tags = {
    Name: "test-instance"
  }
  security_groups = ["launch-wizard-1"]
  key_name = "rearc-quest"
  user_data = file("../install-script.sh")
}

output "instance_id" {
  value = aws_instance.test_instance.id
}

output "instance_public_dns" {
  value = aws_instance.test_instance.public_dns
}

output "instance_public_ip" {
  value = aws_instance.test_instance.public_ip
}
