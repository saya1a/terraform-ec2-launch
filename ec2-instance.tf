resource "aws_instance" "test1" {
  count	= var.ec2_count
  ami = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.TF_SG.name]


  tags = {
    Name = "test-instance"
  }
  
}
