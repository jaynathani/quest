#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
curl -L --fail https://github.com/docker/compose/releases/download/1.28.0/run.sh -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
yum install git -y
git clone https://github.com/jaynathani/quest.git
mv /quest/ /home/ec2-user/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. /.nvm/nvm.sh
nvm install node
. /.nvm/nvm.sh
cd /home/ec2-user/quest/
npm install
