#!/bin/bash 

INST_ID=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped Name=instance-type,Values=t2.micro --query 'Reservations[*].Instances[].InstanceId' --output text) \
&& IMAGE_ID=$(aws ec2 create-image --instance-id $INST_ID --name 'Brodalab3' --description 'An AMI' --query ImageId --output text) \
&& echo $IMAGE_ID \
&& echo $INST_ID 
sleep 10
#3# receive id of instance 
#4# create AMI
#5,6# print img_id, inst_id