#! /bin/bash

sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install git -y
sudo yum install maven -y

if [-d "addressbook"]
then
    echo "repo is cloned and exists"
    cd /home/ec2-user/addressbook
    git pull origin feature/devops_1
else
    git clone "https://github.com/Manohar-Machani/addressbook.git"
fi

cd /home/ec2-user/addressbook
mvn package
