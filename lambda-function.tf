locals {
    lambda_zip_location = "outputs/welcome.zip"
}

data "archive_file" "welcome" {
  type = "zip"
  source_file = "welcome.py"
  output_path = "${local.lambda_zip_location}"
} 


resource "aws_lambda_function" "ec2_start_scheduler_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "ec2_start_instance"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "welcome.lambda_handler" ##filename.methodname
 
  source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"
  runtime = "python3.8"

}



