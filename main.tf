resource "aws_default_vpc" "maruti" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "my_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.maruti.id

  tags = {
    Name = "my_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv6         = ["0.0.0.0/0"]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
