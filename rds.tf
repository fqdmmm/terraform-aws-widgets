resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "${var.db_subnet_group_name}-${var.env}"
  subnet_ids = module.vpc.database_subnets

  tags = var.tags
}

resource "aws_security_group" "rds" {
  name   = var.project_name
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_db_parameter_group" "db-parameter-group" {
  name   = var.project_name
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "primary" {
  identifier             = "${var.project_name}-primary"
  instance_class         = var.db_instance_class
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "15.3"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.db-parameter-group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

resource "aws_db_instance" "replica" {
  identifier             = "${var.project_name}-replica"
  instance_class         = var.db_instance_class
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "15.3"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.db-parameter-group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}