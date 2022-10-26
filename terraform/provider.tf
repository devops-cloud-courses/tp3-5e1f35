terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.36.1"
    }
  }
}

provider "aws" {
  region  = "eu-west-1" # You can put either 'eu-west-1' or 'eu-central-1'
}