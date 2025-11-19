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
