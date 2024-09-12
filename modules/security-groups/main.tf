resource "aws_security_group" "alb_security_group" {
  name   = "alb security group"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = [80, 443] # Iterate over HTTP (80) and HTTPS (443) ports
    iterator = port

    content {
      description = "Allow ${port.value} traffic" # Allowing traffic on specific ports from any source IP.
      from_port   = port.value # Use the current value of the port
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Allow from all IPs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-Alb-SG"
  }
}

# create security group for the container
resource "aws_security_group" "ecs_security_group" {
  name        = "ecs security group"
  description = "enable http/https access on port 80/443 from alb sg only"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = [80, 443] # Iterate over HTTP (80) and HTTPS (443) ports
    iterator = port

    content {
      description     = "Allow ${port.value} traffic from ALB" # Allowing traffic on specific ports from the ALB security group only.
      from_port       = port.value # Use the current value of the port
      to_port         = port.value
      protocol        = "tcp"
      security_groups = [aws_security_group.alb_security_group.id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-ECS-SG"
  }
}