terraform {
backend "remote" {
   organization = "jcprouse-personal"
   workspaces {
    name = "Example-Workspace"
  }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08da401b2768d4754"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}