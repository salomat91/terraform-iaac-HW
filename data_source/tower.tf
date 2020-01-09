data "aws_ami" "centos" {
    filter {
        name   = "root-device-type"
        values = ["ebs"]
        }

    filter {
        name = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS *"]
        } 

    most_recent = true 
    owners = ["679593333241"] 
} 



output "centos" {
    value = data.aws_ami.centos.id
} 




resource "aws_key_pair" "towerkey" {
    key_name   = "towerkey"
    public_key = file("~/.ssh/id_rsa.pub") 
} 


resource "aws_instance" "tower" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.towerkey.key_name
  provisioner "remote-exec" {
      connection {
          host = self.public_ip
          type = "ssh"
          user = "centos"
          private_key = file("~/.ssh/id_rsa")
          }
        inline = [
            "sudo yum install -y epel-release",
            ]
    } 

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_route53_record" "www" {
    zone_id = "Z3YVBW0Q441HN"
    name    = "tower.example.com"
    type    = "A"
    ttl     = "300"
    records = [aws_instance.web.public_ip]
} 



