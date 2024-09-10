provider "aws" {
  region = var.region # north virginia from vars
}

#Security Group
resource "aws_security_group" "IaC-SG" {
  name_prefix = "IaC Security Group"
  description = "Security group for IaC ASG instances"
  vpc_id      = var.vpc_id # from vars

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

#Launch Template
resource "aws_launch_template" "IaC-LT" {
  name_prefix   = "IaC_ASG_Template"
  image_id      = var.ami_id #Ubuntu 22.04 AMI from vars
  instance_type = var.instance_type

  key_name = var.key_name # KP from vars

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.IaC-SG.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1> Automated ASG Setup using Terraform - Siddhesh Dhuri <h1/>" > /var/www/html/index.html
              EOF 
  )
}

# Auto Scaling Group
resource "aws_autoscaling_group" "IaC-ASG" {
  launch_template {
    id      = aws_launch_template.IaC-LT.id
    version = "$Latest"
  }

  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
  vpc_zone_identifier = var.subnet_ids # subnets from vars

  target_group_arns = [aws_lb_target_group.IaC-TG.arn]

  tag {
    key                 = "Name"
    value               = "IaC Auto Scaling Group"
    propagate_at_launch = true
  }
}

# Application Load Balancer
resource "aws_lb" "IaC-LB" {
  name               = "IaC-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.IaC-SG.id]
  subnets            = var.subnet_ids # Added my Subnets !!

  enable_deletion_protection = false
}

# Target Group for ALB
resource "aws_lb_target_group" "IaC-TG" {
  name     = "IaC-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

# Listener for ALB
resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.IaC-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.IaC-TG.arn
  }
}


