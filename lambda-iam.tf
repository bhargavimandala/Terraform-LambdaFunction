 resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"

 policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
      "Sid": "Stmt1594816293425",
      "Action": [
                "ec2:DescribeInstances",
                "ec2:StartInstances",
                "logs:*",
                "ec2:StopInstances"
               
            ],
      "Effect": "Allow",
      "Resource": "*"

      }
    ]
  }
  EOF
}
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}



