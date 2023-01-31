provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "test1" {
  count = var.ec2_count
  ami = var.ami_id
#  instance_type = var.instance_type
  instance_type = var.instance_type[count.index]


#  key_name = "tf-key"
# Security group association
#  security_groups = [aws_security_group.TF-SG.name]
  
  tags = {
    Name = "test-instance"
  }
  
}

# Generate kaypair from ssh-keygen -t rsa -b 2048 and paste at public_key

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "TF-private-key"
}
