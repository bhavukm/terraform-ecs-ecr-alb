##############################################
# Dev Environment Variables
##############################################

region        = "us-east-1"
environment   = "dev"

# Networking
vpc_id         = "vpc-id"
public_subnets = ["subnet-id1", "subnet-id2"]
#private_subnets = ["subnet-ccc333", "subnet-ddd444"]

# Security Groups
alb_sg_id = "sg-id1"
app_sg_id = "sg-id2"

# ECS Configuration
app_cpu      = 256
app_memory   = 512
image_tag    = "latest"
desired_count = 1

# Secret (use ARN of secret in AWS Secrets Manager)

app_secret_arn = "arn:aws:secretsmanager:us-east-1:ACCOUNT-ID:secret:APP_SECRET-3vRpHC"
