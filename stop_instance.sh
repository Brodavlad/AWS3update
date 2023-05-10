#!/bin/bash

INST_ID=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running Name=instance-type,Values=t2.micro --query 'Reservations[*].Instances[].InstanceId' --output text) \
&& aws ec2 stop-instances --instance-ids $INST_ID \
&& echo $INST_ID
sleep 5
    
#3# receive id of instance 
#4# Stop Instance