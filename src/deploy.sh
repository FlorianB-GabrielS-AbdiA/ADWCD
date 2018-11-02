#!/bin/bash

## Checking root

if whoami | grep -q 'root'; 
then 
  echo ""
  echo -n "checking privillage"
  sleep 0.5
  echo -n " ."
  sleep 0.5
  echo -n " ." 
  sleep 0.5
  echo -n " ."
  sleep 0.5
  echo -n " ."
  sleep 0.5
  echo -n " Everything OK !"
  echo ""
else 
  echo -n "."
  sleep 0.5
  echo -n "." 
  sleep 0.5
  echo -n "."
  sleep 0.5 
  echo -n " ."
  sleep 0.5
  echo " !!!! Error you are not root !!!!"
  echo ""
  sleep 3
  echo "exiting"
  sleep 2 
exit 1 
fi

## Checking for docker


echo ""
echo -n "checking for docker"
sleep 0.5
echo -n " ."
sleep 0.5
echo -n " ." 
sleep 0.5
echo -n " ."
sleep 0.5
echo -n " ."
sleep 0.5
if sudo docker --help | grep -q "A self-sufficient runtime for containers";
then 
echo -n " Everything OK !"
sleep 1
else
sudo apt-get install docker*
fi

## deploying docker file 

# building 

lpath=$( sudo readlink -f "$0" )

if ( echo $lpath | grep ".x" ) 
then

path=$( echo $lpath | sudo sed -e 's/deploy.sh.x//')
else

path=$( echo $lpath | sudo sed -e 's/deploy.sh//')
fi

sudo docker build -t btodocker "$path"

# stopping docker instances 

echo "( Debug ) stopping previous containers"
sudo docker stop 9c1d729e2cb6 > /dev/null
sudo docker stop $( docker ps -a -q ) > /dev/null

# starting docker file 

echo "( Debug ) Starting docker Conatiner"

sudo docker run -p 666:80 -t -d -i btodocker /bin/sh -c "service apache2 restart && /bin/sh " 

# making firewall rule 

if iptables -S | grep -q "666"
then 
    echo "Firewall rule already in place "
    sleep 0
else
    echo ""
    echo -n "Generating Firewall rule "
    sleep 0.5
    echo -n " ."
    sleep 0.5
    echo -n " ."
    sleep 0.5
    echo -n " ."
    sleep 0.5
    echo -n " Done "
    echo ""
    sleep 1 
sudo iptables -I INPUT 1 -p tcp --dport 666 -j ACCEPT 
fi 

#Deploying ssl 


## SSLdeploy 

ssldeploy(){

echo "(Warning) You need a domain forwarded to your machine for this to work "

sudo apt-get install certbot
sudo apt-get install python-certbot-apache
sudo certbot certonly 

}

######

echo ""
echo "Deploy ssl/tls ? (Y/N)  "
echo ""
read sslornot

if [[ $sslornot == "Y" ]]
then

ssldeploy

else
echo "" 
echo "(OK) Done !"
echo ""

fi 


