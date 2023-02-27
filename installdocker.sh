#!/bin/bash
set -x
cd /home/azureuser/
touch logs.txt
exec 3>&1 1>>/home/azureuser/logs.txt 2>&1
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt  install docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker

#sudo yum install -y yum-utils
#sudo amazon-linux-extras install docker
#sudo snap install docker
#sudo snap start docker
#sudo snap services
#sudo chmod 666 /var/run/docker.sock
#sudo file /lib/systemd/system/docker.service
#sudo file /lib/systemd/system/docker.socket
#sudo systemctl unmask docker.service
#sudo systemctl unmask docker.socket
#sudo systemctl start docker.service
#sudo systemctl status docker
#sudo service docker start
#sudo usermod -a -G docker ec2-user
#sudo chkconfig docker on
#sudo yum install -y git
#sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo systemctl enable docker

##post installation activities on instance
cd /home/azureuser/
sudo chmod 666 /var/run/docker.sock
mkdir selenoid
cd /home/azureuser/selenoid/

#pulling selenoid image
#sudo docker pull aerokube/selenoid:latest
#echo "selenoid image pulled"

#pulling selenoid-ui image
#sudo docker pull aerokube/selenoid-ui:latest
#echo "selenoid-ui image pulled"

#creating inner directories
mkdir logs
mkdir video
mkdir config

#installing jq to enable json reader
sudo apt-get update
sudo apt install jq -y
#sudo snap install jq
#sudo apt-get install jq

#Nginx installations and configuration
#sudo apt-get update
sudo apt-get install nginx -y

#Git repositories clone Operation:
git clone https://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@github.com/akshayp2728/Selenoidrepo.git
echo "Git clone operation done"
cd /home/azureuser/selenoid/Selenoidrepo/
sudo cp browsers.json /home/azureuser/selenoid/config/
sudo cp default /etc/nginx/sites-available/
sudo systemctl status nginx
sudo systemctl restart nginx
sudo systemctl status nginx


#echo "=================================================="
#echo "Reading the data from browsers.json file"
#echo "=================================================="
cd /home/azureuser/
sudo chmod 666 /var/run/docker.sock
sudo chmod 777 -R selenoid

cd /home/azureuser/
sudo chmod +x dockerimagepull.sh
#sh ./dockerimagepull.sh

exit 0

#echo "======================================================="
#echo "processing for firefox"
#echo "======================================================="
#image1=$(jq -r '.firefox.versions."100.0".image' browsers.json)
#echo "$image1"
#sudo docker pull "$image1"

#image2=$(jq -r '.firefox.versions."101.0".image' browsers.json)
#echo "$image2"
#sudo docker pull "$image2"

#image3=$(jq -r '.firefox.versions."102.0".image' browsers.json)
#echo "$image3"
#sudo docker pull "$image3"

#image4=$(jq -r '.firefox.versions."103.0".image' browsers.json)
#echo "$image4"
#sudo docker pull "$image4"

#image5=$(jq -r '.firefox.versions."104.0".image' browsers.json)
#echo "$image5"
#sudo docker pull "$image5"

#echo "======================================================="
#echo "processing for chrome"
#echo "======================================================="
#sudo chmod 666 /var/run/docker.sock
#image6=$(jq -r '.chrome.versions."100.0".image' browsers.json)
#echo "$image6"
#sudo docker pull "$image6"

#image7=$(jq -r '.chrome.versions."101.0".image' browsers.json)
#echo "$image7"
#sudo docker pull "$image7"
#image8=$(jq -r '.chrome.versions."102.0".image' browsers.json)
#echo "$image8"
#sudo docker pull "$image8"

#image9=$(jq -r '.chrome.versions."103.0".image' browsers.json)
#echo "$image9"
#sudo docker pull "$image9"

#image10=$(jq -r '.chrome.versions."104.0".image' browsers.json)
#echo "$image10"
#sudo docker pull "$image10"

#image11=$(jq -r '.chrome.versions."105.0".image' browsers.json)
#echo "$image11"
#sudo docker pull "$image11"

#echo "======================================================="
#echo "processing for MicrosoftEdge"
#echo "======================================================="
#sudo chmod 666 /var/run/docker.sock
#image12=$(jq -r '.MicrosoftEdge.versions."100.0".image' browsers.json)
#echo "$image12"
#sudo docker pull "$image12"

#image13=$(jq -r '.MicrosoftEdge.versions."101.0".image' browsers.json)
#echo "$image13"
#sudo docker pull "$image13"

#image14=$(jq -r '.MicrosoftEdge.versions."102.0".image' browsers.json)
#echo "$image14"
#sudo docker pull "$image14"

#image15=$(jq -r '.MicrosoftEdge.versions."103.0".image' browsers.json)
#echo "$image15"
#sudo docker pull "$image15"
#image16=$(jq -r '.MicrosoftEdge.versions."104.0".image' browsers.json)
#echo "$image16"
#sudo docker pull "$image16"

#echo "======================================================="
#echo "processing for safari"
#echo "======================================================="
#sudo chmod 666 /var/run/docker.sock
#image17=$(jq -r '.safari.versions."13.0".image' browsers.json)
#echo "$image17"
#sudo docker pull "$image17"

#image18=$(jq -r '.safari.versions."14.0".image' browsers.json)
#echo "$image18"
#sudo docker pull "$image18"

#image19=$(jq -r '.safari.versions."15.0".image' browsers.json)
#echo "$image19"
#sudo docker pull "$image19"

#echo "======================================================="
#echo "processing for android"
#echo "======================================================="
#sudo chmod 666 /var/run/docker.sock
#image20=$(jq -r '.android.versions."8.1".image' browsers.json)
#echo "$image20"
#sudo docker pull "$image20"


#echo "======================================================="
#echo "running selenoid image and selenoid-ui"
#echo "======================================================="
#sudo chmod 666 /var/run/docker.sock
#docker run -d                                 \
#--name selenoid                                 \
#-p 4444:4444                                    \
#-v /var/run/docker.sock:/var/run/docker.sock    \
#-v /home/azureuser/selenoid/config:/etc/selenoid/:ro              \
#-v /home/azureuser/selenoid/video/:/opt/selenoid/video/            \
#-v /home/azureuser/selenoid/logs/:/opt/selenoid/logs/              \
#-e OVERRIDE_VIDEO_OUTPUT_DIR=/home/azureuser/selenoid/video/       \
#aerokube/selenoid:latest-release -log-output-dir /opt/selenoid/logs


#sudo docker run -d --name selenoid-ui --link selenoid -p 5555:8080 aerokube/selenoid-ui --selenoid-uri=http://selenoid:4444