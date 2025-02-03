# AWS Network Load Balancer (NLB) Project

This repository contains Terraform code to deploy an **AWS Network Load Balancer (NLB)** with two EC2 instances acting as web servers. The NLB ensures high availability and distributes incoming traffic evenly across the servers.

## 🚀 Features

- Deploys two EC2 instances with Apache web server.
- Configures a Network Load Balancer (NLB) to manage traffic.
- Auto-registration of EC2 instances in the NLB target group.
- Security group configuration to allow HTTP traffic.
- Automated infrastructure deployment using Terraform.

## 🗂️ Project Structure

```
load-balancer-project/
├── README.md
├── main.tf                # Main Terraform configuration file
├── variables.tf            # Input variable definitions
├── outputs.tf              # Output values after deployment
├── terraform.tfvars        # Variable values
└── scripts/
    └── deploy.sh           # Deployment automation script
```

## 🛠️ Prerequisites

Ensure the following tools are installed on your system:

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) (configured with proper credentials)
- [Terraform](https://www.terraform.io/downloads)
- An existing VPC and Subnets in AWS

## ⚙️ Configuration

1. **Clone the Repository:**

```bash
git clone https://github.com/your-username/load-balancer-project.git
cd load-balancer-project
```

2. **Update Variable Values:**

Modify `terraform.tfvars` with your specific AWS resource IDs:

```hcl
ami_id      = "ami-xxxxxxxx"
key_name    = "your-key-name"
vpc_id      = "vpc-xxxxxxxx"
subnet_ids  = ["subnet-aaaa", "subnet-bbbb", "subnet-cccc"]
```

3. **Initialize Terraform:**

```bash
terraform init
```

4. **Deploy the Infrastructure:**

```bash
terraform apply -auto-approve
```

5. **Access the Load Balancer:**

After deployment, get the DNS name of the NLB:

```bash
terraform output nlb_dns_name
```

Visit the DNS link in your browser to verify the load balancer is distributing traffic between the two servers.

## 📤 Outputs

After a successful deployment, Terraform will output:

- **Web Server 1 ID**
- **Web Server 2 ID**
- **Network Load Balancer DNS Name**

Example:

```
web_server_1_id = i-0123456789abcdef0
web_server_2_id = i-0abcdef1234567890
nlb_dns_name    = my-nlb-1234567890.us-east-1.elb.amazonaws.com
```

## 📜 Files Explained

- **`main.tf`**: Defines all AWS resources including EC2, NLB, Target Groups, and Security Groups.
- **`variables.tf`**: Declares variables like AMI ID, key pair name, VPC ID, and subnet IDs.
- **`terraform.tfvars`**: Stores actual values for declared variables.
- **`outputs.tf`**: Displays EC2 instance IDs and the NLB DNS after deployment.
- **`scripts/deploy.sh`**: Automates the initialization and deployment process.

## 🔐 Security Considerations

- Make sure to use the latest AMI IDs to avoid vulnerabilities.
- Restrict SSH access using security groups (if needed).
- Enable encryption for sensitive data if extending the project.

## 🧹 Cleanup

To destroy all the resources created:

```bash
terraform destroy -auto-approve
```
