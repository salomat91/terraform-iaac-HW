resource "aws_iam_user" "tim"{
    name = "tim"
    path = "/"
}



resource "aws_iam_group" "developers" {
    name = "developers"
    path ="/"
}


resource "aws_iam_group_membership" "developers_team" { 
  name = "developers-group-membership" 
  users = [ 
    aws_iam_user.tim.name 
  ] 
  group = aws_iam_group.developers.name 
 
} 

resource "aws_iam_role" "test_role" { 
name = "test_role" 
assume_role_policy = <<EOF 
{ 
  "Version": "2012-10-17", 
  "Statement": [ 
{ 
  "Action": "sts:AssumeRole", 
  "Principal": { 
  "Service": "ec2.amazonaws.com" 
}, 
  "Effect": "Allow", 
  "Sid": "" 
    } 
  ] 
} 
EOF 
} 