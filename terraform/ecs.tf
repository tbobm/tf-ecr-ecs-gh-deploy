resource "aws_ecs_cluster" "cluster" {
  name = local.ecs["cluster_name"]
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight = "100"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  requires_compatibilities = [
    "FARGATE",
  ]
  network_mode = "awsvpc"
  cpu       = 256
  memory    = 512
  container_definitions = jsonencode([
    {
      name      = "hello"
      image     = "particule/helloworld"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "tf-alb"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  # iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]

  network_configuration {
    subnets = [for s in data.aws_subnet.subnets : s.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.group.arn
    container_name   = "hello"
    container_port   = 80
  }
}
