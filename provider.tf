terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.42.0"
   }
 }

 backend "s3" {
   bucket = "exceloid-terraform-tfstat"
   key    = "state"
   region = "us-east-1"
 }
}
