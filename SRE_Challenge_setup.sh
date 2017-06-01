#!/bin/bash

echo "***************************** Automation Assignment *********************************************"
echo "***************Hello we are starting with the setup PROCESS, it may take some time **************"

sudo yum -y install wget curl unzip python
sudo yum -y groupinstall "Development tools"
echo "Installing aws-cli..."
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
sudo rm awscli-bundle.zip

# Configure AWS-CLI
echo "Configuring aws-cli..."
if [ ! -d ~/.aws ]
then
    mkdir -p ~/.aws
fi

# Inputs from the end user

echo "Here we are configring AWS CLI tools, please provide the necessary details such as Region, Access key and Secret key"

printf "Enter default AWS region: "
read AWS_DEFAULT_REGION
printf "Enter AWS acces key ID: "
read AWS_ACCESS_KEY_ID
printf "Enter AWS secret access key: (will not echo) "
read -s AWS_SECRET_ACCESS_KEY



# Set credentials for AWS
echo "[default]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
region=$AWS_DEFAULT_REGION" > ~/.aws/credentials



# export AWS credential variables in .bash_profile file
echo "export AWS_ACCESS_KEY_ID='$AWS_ACCESS_KEY_ID'">>~/.bash_profile
echo "export AWS_SECRET_ACCESS_KEY='$AWS_SECRET_ACCESS_KEY'">>~/.bash_profile


source ~/.bash_profile
# Instructions
#echo "***********AWS-CLI-Installed***********"




#================================================================================================================================#

#Chef-DK installation and Workstation setup..

echo " :) .......Now we proceed with Chef workstation setup process.........., Hold on for some time..........!!!!!!!!!!! :) "

curl -L https://www.opscode.com/chef/install.sh | sudo bash

unzip chef-starter.zip


cd chef-repo


knife ec2 server create --flavor t1.micro --image ami-8997afe0  --security-group-ids sg-a5a86ed9 --tags Name=SRE-Challenge --node-name SRE-Challenge  --region us-east-1 --availability-zone  us-east-1a --subnet subnet-a9ea9d84  --run-list 'recipe[apache]'  --ssh-key base_key --ssh-user root --identity-file ~/base_key.pem