#!/bin/bash

IMAGE_ID=$(aws ec2 describe-images --owners 695200478063 --query 'Images[*].ImageId' --output text) \
&& echo $IMAGE_ID \
&& aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type t2.micro --key-name MyKeyLab3 --security-group-ids $SG --user-data file://user_data.sh
sleep 10
#3# receive AMI id
#5# run Instance