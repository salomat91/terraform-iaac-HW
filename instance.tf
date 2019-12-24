resource "aws_instance" "web" { 
  count = 10
  ami           = var.ami 
  instance_type = "t2.micro" 
  associate_public_ip_address = "true" 
  key_name = aws_key_pair.deployer.key_name
  security_groups = ["allow_ssh"]
  user_data = file("userdata_file")
  
  lyfecycle{
    prevent_destroy = false
  }

  tags = { 

    Name = "HelloWorld${count.index +1}"

  } 
}
