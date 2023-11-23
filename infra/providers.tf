terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
  backend "s3" {
    bucket = "2006-terraform-state"
    key    = "2006_state"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}