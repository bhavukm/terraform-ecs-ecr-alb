# terraform-ecs-ecr-alb
terraform-ecs-ecr-alb

# Project 4 — ECR + ECS Fargate service behind ALB

**Architectural Diagram:**

<img width="750" height="572" alt="AWS ECS TF-Copy of Page-1 drawio" src="https://github.com/user-attachments/assets/a6ea9fd5-b94b-4c3e-ab5b-563994100e47" />

**Real-world problem**
**Problem summary:**
You need to run a containerized web application in production without managing EC2 hosts, with secure secrets, automated image delivery, and public access behind a load balancer.
**Challenges:** building and storing container images, providing tasks secure access to secrets, ensuring tasks can pull images and report logs, exposing the app reliably to users, and deploying repeatably across environments.

**Solution summary**
**How this project solves it**
1. **ECR repository:** Stores and versioned container images so deployments use tagged images.
2.** Local image push (or CI integration):** Ensures the image is available in ECR before registering the task.
3. **ECS Fargate task + service:** Runs containers serverlessly (no host management) with specified CPU/memory and platform version.
4.** ALB + target group + listener:** Routes HTTP traffic to tasks, and health checks ensure only healthy tasks receive traffic.
5. **IAM execution role + Secrets Manager mapping:** Let tasks securely retrieve secrets (no plaintext creds in code).
6. **CloudWatch logs:** Centralize application logs for troubleshooting.
7. **Security groups + network config:** Ensures tasks have outbound access to AWS APIs/ECR and restricts inbound to the ALB.
8. **Terraform (IaC):** Makes this architecture reproducible, reviewable, and version controllable across dev/stage/prod.

Step-By-Step Implementation:



