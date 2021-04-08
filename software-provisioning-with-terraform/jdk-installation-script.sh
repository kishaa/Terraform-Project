#! /bin/bash
echo "Hello I'm going to install java on this machine"

echo "Now going to run sudo apt update command"
sudo apt update

echo "Installing jdk version 8"
sudo apt install openjdk-8-jdk

echo "Thanks for executing me operation has been accomplished" > /home/ec2-user/installation.output