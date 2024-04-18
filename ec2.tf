resource "aws_instance" "ec2_publica" {
  ami                    = "ami-0a699202e5027c10d"
  instance_type          = "t2.micro"
  key_name               = "ansible-keys"
  subnet_id              = aws_subnet.public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.sg_bastion_host.id]

  tags = {
    Name = "BastionHost"
    AnsibleGroup = "EC2_1"
    owner = "jonatan.dguez"
    env = "prod"
  }
}

resource "aws_instance" "ec2_privada" {
  count                  = length(aws_subnet.private_subnet)
  ami                    = "ami-0a699202e5027c10d" 
  instance_type          = "t2.micro"
  key_name               = "ansible-keys"
  subnet_id              = aws_subnet.private_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.sg_instancias_privadas.id]

  tags = merge(
    {
      Name         = "ec2-private-${count.index}"
      owner        = "jonatan.dguez"
      env          = "prod"
      AnsibleGroup = "EC2_1"
    },
    count.index == 0 ? { GitGroup = "clone" } : {}
  )
}

