resource "aws_instance" "test1" {
  count = var.ec2_count
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "tf-key"
# Security group association
  security_groups = [aws_security_group.TF-SG.name]
  
  tags = {
    Name = "test-instance"
  }
  
}

# Generate kaypair from ssh-keygen -t rsa -b 2048 and paste at public_key
resource "aws_key_pair" "TF_key" {
  key_name = "tf-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQkjkhhghjvH5Hq1qi9odFye8HEA1pSPi8YGaBJgkdS7XQpStD9xN8XtMi3Zmch0c+F/Z58pYswuGKB8DoccX3Kcr5ouxkMZnWiOiCaIpAtT7mF0HxtQ== root@master-node"
  
}
