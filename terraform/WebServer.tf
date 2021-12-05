#------------------------------
#My Terraform
#
#Build WebServer during Bootstrap
#
#Made by Andrii Maksymonko

provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "wordpress" {
  count = 2
  ami = "ami-0a49b025fffbbdac6"   #Amazon Linux
	instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name = "max-test-frankfurt"
  tags = {
  Name = "wordpress"
  }
}

resource "aws_instance" "DB" {
  ami = "ami-0a49b025fffbbdac6"   #Amazon Linux
	instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name = "max-test-frankfurt"
  tags = {
  Name = "DB"
  }
}

# resource "aws_instance" "ansibleMaster" {
#   ami = "ami-0a49b025fffbbdac6"   #Amazon Linux
# 	instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.my_webserver.id]
#   key_name = "max-test-frankfurt"
#   tags = {
#   Name = "ansibleMaster"
#   }
# }



resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First SecurituGroup"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

