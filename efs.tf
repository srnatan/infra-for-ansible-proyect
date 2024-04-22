resource "aws_efs_file_system" "ansible_efs" {
  performance_mode = "generalPurpose"
  encrypted        = false

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name: "ansible_efs"
  }
}

resource "aws_efs_mount_target" "efs_mt" {
  count           = length(aws_subnet.private_subnet)
  file_system_id  = aws_efs_file_system.ansible_efs.id
  subnet_id       = aws_subnet.private_subnet[count.index].id
  security_groups = [aws_security_group.sg_efs.id]
}