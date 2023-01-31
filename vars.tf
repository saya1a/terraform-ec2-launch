variable "ec2_count" {
  default = "2"
}

variable "ami_id" {
  default = " "
}
/*
variable "instance_type" {
  default = "t2.micro"
} 
*/

# for different instance types

variable "instance_type" {
  type = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}
