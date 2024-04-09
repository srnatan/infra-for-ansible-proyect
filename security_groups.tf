resource "aws_security_group" "sg_bastion_host" {
  name        = "sg_bastion_host"
  description = "SG para bastion host que permite acceso SSH desde mi IP"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.mi_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_efs" {
  name        = "sg_efs"
  description = "SG para EFS que permite acceso por el puerto 2049 desde las instancias privadas"
  vpc_id      = aws_vpc.main_vpc.id

  #   ingress {
  #     from_port       = 2049
  #     to_port         = 2049
  #     protocol        = "tcp"
  #     security_groups = [aws_security_group.sg_instancias_privadas.id]
  #   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  description = "SG para RDS que permite acceso por el puerto 3306 desde las instancias privadas"
  vpc_id      = aws_vpc.main_vpc.id

  #   ingress {
  #     from_port       = 3306
  #     to_port         = 3306
  #     protocol        = "tcp"
  #     security_groups = [aws_security_group.sg_instancias_privadas.id]
  #   }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_load_balancer" {
  name        = "sg_load_balancer"
  description = "SG para Load Balancer que permite el acceso por el puerto 80 para todo el mundo"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_instancias_privadas" {
  name        = "sg_instancias_privadas"
  description = "SG para Load Balancer que permite el acceso por el puerto 80 para todo el mundo"
  vpc_id      = aws_vpc.main_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

