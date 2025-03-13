# Terraform Block
terraform {
  required_version = "~> 1.9" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }    
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }            
  }
  
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {}      
}

# Provider Block
provider "aws" {
  region  = var.aws_region
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}