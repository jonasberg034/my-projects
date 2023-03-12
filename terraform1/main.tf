provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

output "tf_ec2_public_ip" {
  value = " My public ip is ${aws_instance.tf-ec2.public_ip}"
    
}

output "tf-example-s3" {
  # value = aws_s3_bucket.tf-s3.*.bucket
  value = values(aws_s3_bucket.tf-s3).*.bucket
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 3]
}


locals {
  mytag= "jonas-local-name"
}


resource "aws_instance" "tf-ec2" {
    ami           = var.ec2-ami
    instance_type = var.ec2-type
    key_name      = "oslo"    #<pem f ile>
    tags = {
      Name ="${local.mytag}-instance" 
  }
}
 
resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.s3_bucket_name}-${count.index}"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  for_each = toset(var.users)
  bucket = "tf-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}
