provider "aws" {
    region = "eu-west-2"
}

resource "aws_iam_user" "my_user" {
  name = "ec2_users"
}

resource "aws_iam_policy" "ec2_full_access" {
  name = "ec2_full_access"
  
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": "ec2:*",
			"Resource": "*"
		}
	]
}
  EOF
}

resource "aws_iam_policy_attachment" "policy_bind" {
  name = "attachment"
  users = [aws_iam_user.my_user.name]
  policy_arn = aws_iam_policy.ec2_full_access.arn
}