# terraform-ecs-ecr-alb
terraform-ecs-ecr-alb

# Project 4 — ECR + ECS Fargate service behind ALB

**Real-world problem**
**Problem summary:**
You need to run a containerized web application in production without managing EC2 hosts, with secure secrets, automated image delivery, and public access behind a load balancer.
Challenges: building and storing container images, providing tasks secure access to secrets, ensuring tasks can pull images and report logs, exposing the app reliably to users, and deploying repeatably across environments.

**Solution summary**
**How this project solves it**
ECR repository: stores and versioned container images so deployments use tagged images.
Local image push (or CI integration): Ensures the image is available in ECR before registering the task.
ECS Fargate task + service: runs containers serverlessly (no host management) with specified CPU/memory and platform version.
ALB + target group + listener: routes HTTP traffic to tasks, and health checks ensure only healthy tasks receive traffic.
IAM execution role + Secrets Manager mapping: lets tasks securely retrieve secrets (no plaintext creds in code).
CloudWatch logs: centralize application logs for troubleshooting.
Security groups + network config: ensures tasks have outbound access to AWS APIs/ECR and restricts inbound to the ALB.
Terraform (IaC): makes this architecture reproducible, reviewable, and version controllable across dev/stage/prod.


