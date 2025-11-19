listen_port = "8080"
php_version = "8.1"

instance_type = "t3.medium"

# IMPORTANT: Ensure this matches exactly what is shown in the AWS Console -> EC2 -> Key Pairs.
# If your key is named "personal-chima.pem" in AWS, keep the .pem. 
# If it is just "personal-chima", remove the .pem extension below.
key_name = "personal-chima.pem"

tags = {
  Name = "DVWA"
}
```

### Next Steps

1.  **Save** these three files to your directory.
2.  **Run `terraform init`** (if you haven't recently, or `terraform init -reconfigure` if you see errors).
3.  **Run `terraform plan`** to verify that Terraform detects the changes (it should show that `aws_key_pair` will be destroyed if it exists in state, and `aws_instance` might be replaced or updated).
4.  **Run `terraform apply`**.
5.  **Connect:** When SSHing, make sure you point to your local private key file:
    ```bash
    ssh -i /path/to/personal-chima.pem ubuntu@<public-ip>
