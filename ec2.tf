resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "Widgets-Web"
  }



}


