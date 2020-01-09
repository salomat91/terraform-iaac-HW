provider "aws" {
    region = "us-east-1" 
} 



data "aws_ami" "centos1" {
    filter {
        name   = "name"
        values = ["ebs"]
        }


    most_recent = true 
    owners = ["679593333241"] 
} 



output "ami" {
    value = data.aws_ami.centos1.id
} 



resource "aws_instance" "web" {
  ami           = data.aws_ami.centos1.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}