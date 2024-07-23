#!/bin/bash
# The purpose of this script is to install vim editor.
#this script will also run the servers healt checks and ptching.
#

echo '========================================================================'
echo 'Now installing your preferred editor'
sleep 5
sudo yum install vim nano -y
echo '========================================================================'
echo 'Ready to run the servers health checks'
echo '========================================================================'
echo ' Tody is:' `date` > /home/ec2-user/pre-checks.log
echo '========================================================================' >> /home/ec2-user/pre-checks.log
echo 'df -h :' >>/home/ec2-user/pre-checks.log
df -kh >>/home/ec2-user/pre-checks.log
echo '========================================================================' >> /home/ec2-user/pre-checks.log
echo 'free -m:' >>/home/ec2-user/pre-checks.log
free -g >> /home/ec2-user/pre-checks.log
echo '========================================================================' >> /home/ec2-user/pre-checks.log
echo 'cat /etc/os-release :' >> /home/ec2-user/pre-checks.log
cat /etc/os-release >> /home/ec2-user/pre-checks.log
echo '========================================================================' >> /home/ec2-user/pre-checks.log
echo 'Getting ready for patching'
sleep 3
echo '========================================================================'
echo 'Now patching.....'
echo '========================================================================'
sudo yum update -y 
echo '========================================================================'
echo ' Running post patching checks'
echo '========================================================================'
echo ' Tody is:' `date` > /home/ec2-user/post-checks.log
echo '========================================================================' >> /home/ec2-user/post-checks.log
echo 'df -h :' >> /home/ec2-user/post-checks.log
df -kh >> /home/ec2-user/post-checks.log
echo '========================================================================' >> /home/ec2-user/post-checks.log
echo 'free -m :' >> /home/ec2-user/post-checks.log
free -g >> /home/ec2-user/post-checks.log
echo '========================================================================' >> /home/ec2-user/post-checks.log
echo 'cat /etc/os-release :' >> /home/ec2-user/post-checks.log
cat /etc/os-release >> /home/ec2-user/post-checks.log
echo '========================================================================' >> /home/ec2-user/post-checks.log
sdiff /home/ec2-user/pre-checks.log /home/ec2-user/post-checks.log
echo '========================================================================' 


