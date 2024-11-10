provider "aws" {
  region = "eu-west-1"
}

# Define the security group for the web server
resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from anywhere (public)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows HTTP from anywhere (public)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the EC2 instance resource
resource "aws_instance" "web_server" {
  ami           = "ami-0716024d58ff64439"  # Correct AMI ID for Dublin region
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_server_sg.name]
  key_name      = "ec2key"  # Use the correct key pair name

  tags = {
    Name = "tempinst"  # Instance name can be customized
  }
}
