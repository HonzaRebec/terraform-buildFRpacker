provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "aws-credentials.ini"
  profile                 = "default"

  version = "~> 2.41"
}

