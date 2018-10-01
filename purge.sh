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
  echo ""
  echo " (!) Error you are not root "
  echo ""
  sleep 3
  echo "exiting"
  sleep 2 
exit 1 
fi

### Purge 

purge(){

 echo -n "Purging the BTO docker container "
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5 

 sudo service apache2 stop
 sudo rm -R /var/www/html/*
 sudo docker rmi --force btodocker
 sudo docker rm --force btodocker
 sudo docker stop 9c1d729e2cb6
 sudo docker stop $( docker ps -a -q ) 

 echo -n "removing iptables rule "
   if ( iptables -S | grep "666")
    then 
      sudo iptables -D INPUT -p tcp --dport 666 -j ACCEPT
    else 
      echo "iptables already clean "
   fi 
}

### Restart 

restart(){

 echo -n "Restarting docker container "
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5
 echo -n "." && sleep 0.5 
 sudo docker stop $( docker ps -a -q )
 sudo docker start 9c1d729e2cb6
 sudo service apache2 restart 
 echo -n "checking iptables rule "
   if ( iptables -S | grep "666")
    then 
     sleep 0.5
    else 
      echo -n "renewing iptables rule "
      sudo iptables -I INPUT 1 -p tcp --dport 666 -j ACCEPT
   fi 
}

### Main 

echo -n "(P)urge or R(estart) ? "
read por 

if [[ $por == "P" ]];
    then 
      purge
    else 
      if [[ $por == "R" ]];
        then 
      restart
        else 
      echo " An error Occured " 
      fi  
    fi




