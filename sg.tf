resource "aws_security_group" "allow_ssh_h" { 
  name        = "allow_ssh_h" 
  description = "Allow ssh inbound traffic" 
  vpc_id      = "vpc-475dd123" 
  ingress { 
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]   
} 
egress { 
    from_port       = 0 
    to_port         = 0 
    protocol        = "-1" 
    cidr_blocks     = ["0.0.0.0/0"] 
  } 
} 