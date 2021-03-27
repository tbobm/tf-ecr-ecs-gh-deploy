resource "aws_lb_target_group" "group" {
  name        = "tf-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.main.id
  target_type = "ip"

  depends_on = [aws_lb.alb]
}

data "aws_subnet" "subnets" {
  for_each          = toset(local.vpc.availability_zones)
  vpc_id            = data.aws_vpc.main.id
  availability_zone = each.value
}

data "aws_vpc" "main" {
  id = local.vpc["id"]
}

resource "aws_lb" "alb" {
  name               = "tf-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [for s in data.aws_subnet.subnets : s.id]

  enable_deletion_protection = false

  tags = {
    Environment = "development"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group.arn
  }
}

output "app_url" {
  value       = aws_lb.alb.dns_name
  description = "The public ALB DNS"
}
