terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.42.0"
   }
 }

 backend "s3" {
   bucket = "exceloid-tfstate-terraform"
   key    = "state"
   region = "us-east-1"
 }
}
