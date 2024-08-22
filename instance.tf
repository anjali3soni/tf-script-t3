resource "aws_instance" "jk-inst1" {
  ami = "ami-0862be96e41dcbf74"
  instance_type = "t2.medium"
  key_name = "jk-task"
  security_groups = [ aws_security_group.jk-sg.id ]
  subnet_id = module.vpc.private_subnets[0]
  tags = {
    Name = "jk-inst1"
  }
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
}

resource "aws_instance" "bashion" {
  ami = "ami-0862be96e41dcbf74"
  instance_type = "t2.micro"
  key_name = "jk-task"
  security_groups = [ aws_security_group.jk-sg.id ]  
  subnet_id = module.vpc.public_subnets[0]
  tags = {
    Name = "bashion"
  }
}
resource "aws_instance" "jk-inst2" {
  ami = "ami-0862be96e41dcbf74"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.jk-sg.id ]
  key_name = "jk-task"
  subnet_id = module.vpc.public_subnets[1]
  tags = {
    Name = "jk-inst2"
  }
}
resource "aws_instance" "jk-inst3" {
  ami = "ami-0862be96e41dcbf74"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.jk-sg.id ]
  key_name = "jk-task"
  subnet_id = module.vpc.private_subnets[1]
  tags = {
    Name = "jk-inst3"
  }
}
