resource "aws_iam_user" "tim"{
    name = "tim"
    path = "/"
}



resource "aws_iam_group" "developers" {
    name = "developers"
    path ="/"
}

data "aws_iam_policy_document" "example" { 
  statement { 
    actions = ["*"] 
    resources = ["*"] 
  } 
} 
 
resource "aws_iam_policy" "example" { 
  name = "test_policy" 
  policy = data.aws_iam_policy_document.example.json 
} 
