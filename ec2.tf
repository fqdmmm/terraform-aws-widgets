resource "aws_instance" "web" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "Widgets-Web"
  }



}


