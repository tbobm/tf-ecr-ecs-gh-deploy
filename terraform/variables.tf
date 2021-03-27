variable "aws_region" {
  type        = string
  default     = "eu-west-3"
  description = "AWS region"
}

variable "ecr_values" {
  type        = any
  default     = {}
  description = "AWS ECR configuration"
}

variable "ecs_values" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
}

variable "lb_values" {
  type        = any
  default     = {}
  description = "AWS Load Balancer configuration"
}

variable "vpc_values" {
  type        = any
  default     = {}
  description = "AWS Load Balancer configuration"
}

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}
