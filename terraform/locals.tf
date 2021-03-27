locals {
  region = var.aws_region
  ecr_defaults = {
    repository_name = "app-registry"
  }
  ecr = merge(local.ecr_defaults, var.ecr_values)

  ecs_defaults = {
    cluster_name = "ecs-cluster"
    service_name = "ecs-service"
  }
  ecs = merge(local.ecs_defaults, var.ecs_values)

  lb_defaults = {
    alb_name = "tf-alb"
  }
  lb = merge(local.lb_defaults, var.lb_values)

  vpc_defaults = {
    id                 = "vpc-ef26d387"
    availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]
    subnets = {
      "${local.region}a" = "172.31.0.0/20"
      "${local.region}b" = "172.31.16.0/24"
      "${local.region}c" = "172.31.32.0/24"
    }
  }
  vpc = merge(local.vpc_defaults, var.vpc_values)

  container_defaults = {
    name  = "hello"
    image = "particule/helloworld"
    ports = [80]
  }
  container = merge(local.container_defaults, var.container)
}
