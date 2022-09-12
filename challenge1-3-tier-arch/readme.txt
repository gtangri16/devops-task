3-Tier Architecture
###################################################################
Prerequsite to provision infrastructure
1.Az cli
2.Terraform                                      
###################################################################

Steps to follow
1. Open terminal - Navigate to template folder
2. Login to azure - Run command - az login
3. Select the default subscription- az account set --s "<<subscription Name>>"
4. Run terraform Init 
5. Run terraform plan -var-file="../tfvars/app.tfvars"   ###  Plan will show on terminal which resources are going to deployed in Azure
6. Run terraform apply -var-file="../tfvars/app.tfvars"


