##############################################
# Dev Environment Variables
##############################################

region        = "us-east-1"
environment   = "dev"

# Networking
vpc_id         = "vpc-04d5b32b51bacef30"
public_subnets = ["subnet-0139468bf76f6222c", "subnet-0f0dc8f386f5575ff"]
#private_subnets = ["subnet-ccc333", "subnet-ddd444"]

# Security Groups
alb_sg_id = "sg-0ee6436bdccc2269a"
app_sg_id = "sg-0ee6436bdccc2269a"

# ECS Configuration
app_cpu      = 256
app_memory   = 512
image_tag    = "latest"
desired_count = 1

# Secret (use ARN of secret in AWS Secrets Manager)
app_secret_arn = "arn:aws:secretsmanager:us-east-1:875388088075:secret:APP_SECRET-3vRpHC"