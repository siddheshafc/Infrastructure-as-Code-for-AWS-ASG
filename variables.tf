variable "region" {
  description = "AWS Region"
  default     = "us-east-1" #NV
}

variable "vpc_id" {
  description = "Your VPC ID of AWS Account"
  default     = "vpc-xxxxx"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
  default     = ["subnet-xxxx", "subnet-xxxx"]
}

variable "key_name" {
  description = "The name of the key pair for EC2 instances"
  default     = "xxx"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  default     = "ami-0a0e5d9c7acc336f1"

}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  default     = "t2.micro"
}
