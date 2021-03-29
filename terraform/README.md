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
| aws\_region | The AWS region used |
| container\_name | Container name for the ECS task |
| ecr\_repository\_name | The ECR repository name |
| ecr\_url | The ECR repository URL |
| ecs\_cluster | The ECS cluster name |
| ecs\_service | The ECS service name |
| publisher\_access\_key | AWS\_ACCESS\_KEY to publish to ECR |
| publisher\_secret\_key | AWS\_SECRET\_ACCESS\_KEY to upload to the ECR |

