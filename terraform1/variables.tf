variable "ec2_name" {
  default = "oslo-ec2"
  description = "The new variable"
}

variable "ec2-type" {
  default = "t2.micro"

}
 variable "ec2-ami" {
  default = "ami-0742b4e673072066f"
   
 }

variable "s3_bucket_name" {
  default = "oslo-s3"
}

variable "num_of_buckets" {
  default = 2
  
}

variable "users" {
  default = ["santino", "michael", "fredo"]

}