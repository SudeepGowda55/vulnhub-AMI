# Create an IAM role using trust-policy.json

# aws iam create-role --role-name vmimport --assume-role-policy-document ''file://~/trust-policy.json''

# Attach the role-policy.json to IAM role

# aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document ''file://~/role-policy.json''

echo "Importing the Vulnhub OVA file from vulnhub-ami S3 Bucket"

aws ec2 import-image --description ''AMI'' --disk-containers ''file://~/containers.json''

read -p "Enter the import task id: " task_id

# import image process

aws ec2 describe-import-image-tasks --import-task-ids $task_id

echo ""

echo ""

echo "To monitor the import image process run this command and it takes 4-5 mins to complete the process" 

echo ""

sleep 2

echo ""

echo "aws ec2 describe-import-image-tasks --import-task-ids $task_id"