
resource "aws_vpc" "main" {
  tags = {
    Name = "example"
  }
}

resource "aws_security_group" "example" {
  name        = var.sg_name
  description = "Allow inbound traffic on port 80 and 22"
  vpc_id = aws_vpc.main.id  # Reference the ID of the VPC created above

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress1_cidr_ipv4  # Allow traffic from any source on port 80
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress2_cidr_ipv4  # Allow traffic from any source on port 22 (SSH)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = var.egress1_cidr_blocks
  }

  tags = {
    Name = "security-group"
  }
}
