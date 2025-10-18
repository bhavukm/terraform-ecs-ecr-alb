# terraform-ecs-ecr-alb
terraform-ecs-ecr-alb

# Project 4 — Automated ECR image delivery + Secrets-backed ECS Fargate + ALB routing and CloudWatch observability

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

**Step-By-Step Implementation:**

**Install Terraform:** https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

**Install AWS CLI:** https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

**Configure AWS CLI:** https://youtu.be/TF9oisb1QJQ

**Create an S3 Bucket:** _aws s3api create-bucket --bucket tf-state- --region us-east-1_ # Optional, only required if you want Terraform state file to be stored on an S3 bucket

**Optional, only required if you want Terraform state file locking enabled**
**Create DynamoDB table for state locking:** _aws dynamodb create-table --table-name tf-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --region us-east-1_

**Explanation of the different command flags:**

--table-name tf-locks → Name of the DynamoDB table

--attribute-definitions → Defines LockID as a string (S)

--key-schema → Sets LockID as the partition key (HASH)

--provisioned-throughput → 1 read & 1 write per second (enough for Terraform)

--region → Region where the table will be created



