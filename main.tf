terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# global
locals {
  region = "eu-west-1"
  environment = "Production"
}

# only for droplet
locals {
    image = "ubuntu-24-04-x64"
    name = "personal-website"
    do-region = "fra1"
    size = "s-1vcpu-512mb-10gb" 
}

provider "aws" {
  region = local.region
  profile = "default"
}

provider "digitalocean" {
    token = var.do_token
}


