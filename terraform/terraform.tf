terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 2.3"
        }
    }

    required_version = ">=1.1"
}