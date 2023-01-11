resource "aws_security_group" "TF-SG" {
  name = "my-ec2-SG"
  description = "SG for EC2 Instances"
  vpc_id = "vpc-a8b359d2"

  ingress {
    description = "HTTP"
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "HTTPS"
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name = "TF-SG"

  }
}
