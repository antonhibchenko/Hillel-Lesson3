variable "instance_type" {
  description = "t3.micro"
  default     = "t3.micro"
  type        = string
}

variable "eip_attach" {
  type = bool
  default = true
  description = "Attach Elastic IP to instance"
}

variable "volume_size" {
  description = "attached volume"
  type        = string
  default     = "10"
}

variable "aws_key_pair" {
  description = "The key name to use for the instance"
  type        = string
}

variable "ami_filter" {
  description = "AMI filter from data"
  type = bool
  default = true
}

variable "ami_id" {
  description = "AMI filter from data"
  type = string
  default = "ami-0502e817a62226e03"
}