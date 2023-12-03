variable "region" {
  description = "aws region"
  default     = "us-east-2"
}

variable "account_id" {
  default = "073537652807"
}

variable "project-name" {
  type        = string
  description = "Name of Project"
  default     = "lakehouse-challenge"
  
}
variable "environment" {
  type        = string
  description = "Environment of project"
  default     = "dev"
}

variable "prefix" {
  description = "objects prefix"
  default     = "lakehouse-challenge"
}

variable "bucket-names" {
  description = "s3 bucket names"
  type        = list(string)
  default     = [ 
    "landing-zone",
    "bronze",
    "silver",
    "gold",
    "scripts"
   ]
}