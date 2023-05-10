#!/bin/bash

aws ec2 create-key-pair --key-name MyKeyLab3 --query 'KeyMaterial' --output text > MyKeyLab3.ppk \
&& chmod 400 MyKeyLab3.ppk \
&& VPC_ID=$(aws ec2 describe-vpcs --query 'Vpcs[0].VpcId' --output text) \
&& aws ec2 create-security-group --group-name SecurityGroup --description "security group lab3" \
&& SG=$(aws ec2 describe-security-groups --query 'SecurityGroups[0].GroupId' --output text) \
&& aws ec2 authorize-security-group-ingress --group-id $SG --protocol tcp --port 22 --cidr 0.0.0.0/0 \
&& aws ec2 authorize-security-group-ingress --group-id $SG --protocol tcp --port 80 --cidr 0.0.0.0/0 \
&& aws ec2 authorize-security-group-ingress --group-id $SG --protocol tcp --port 443 --cidr 0.0.0.0/0 \
&& NET_ID=$(aws ec2 describe-subnets --query 'Subnets[0].SubnetId' --output text) \
&& INST_ID=$(aws ec2 run-instances --image-id ami-0889a44b331db0194 --count 1 --instance-type t2.micro --key-name MyKeyLab3 --security-group-ids $SG --user-data file://user_data.sh --query 'Instances[*].[InstanceId]' --output text) \
&& aws ec2 create-tags --resources $INST_ID --tags Key=Role,Value=WebServer \
&& echo $INST_ID 
sleep 10



#3# create a key pair and output.
#4# change acces from modified keypair
#5# create default vpc id
#6# create security group with rule to allow ssh
#7# describe SG to configure them easily
#8,9,10# configuring security groups 
#11# create default subnet id
#12# create instance    
#13,14# call instance, receive inst id