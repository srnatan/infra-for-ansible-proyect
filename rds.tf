# Subnet Group para RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.private_subnet[*].id

  tags = {
    Name = "rds-subnet-group"
  }
}

# Instancia RDS con MariaDB
resource "aws_db_instance" "ansible_rds" {
  //identifier             = "ansible_rds_srnatan"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mariadb"
  engine_version         = "10.6.10"
  instance_class         = "db.t3.micro"
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  db_name                = var.db_name
  username               = var.master_user
  password               = var.master_pass
  skip_final_snapshot    = true

  tags = {
    Name     = "rds-mariadb"
    GitGroup = "clone"
  }
}
