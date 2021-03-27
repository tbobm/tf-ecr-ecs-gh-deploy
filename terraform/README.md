# Infrastructure setup

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS region | `string` | `"eu-west-3"` | no |
| container | Container configuration to deploy | `any` | `{}` | no |
| ecr\_values | AWS ECR configuration | `any` | `{}` | no |
| ecs\_values | AWS ECS configuration | `any` | `{}` | no |
| lb\_values | AWS Load Balancer configuration | `any` | `{}` | no |
| vpc\_values | AWS Load Balancer configuration | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_url | The public ALB DNS |
