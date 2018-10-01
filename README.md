<p align="center">
   
   <a href=""><img src="https://img.shields.io/github/issues/FlorianB-AdrianS-AbdiA/ADWCD.svg"></a>
   <a href=""><img src="https://img.shields.io/github/forks/FlorianB-AdrianS-AbdiA/ADWCD.svg" alt="issues"></a>
   <a href=""><img src="https://img.shields.io/github/stars/FlorianB-AdrianS-AbdiA/ADWCD.svg" alt="forks"></a>
   <a href=""><img src="https://img.shields.io/github/license/FlorianB-AdrianS-AbdiA/ADWCD.svg" alt="stars"></a>       
</p>




# ADWCD 1.0 

Apache-Docker-Web-Container-Deployer or ADWCD is a tool developed for a school Project. 
It is intended to spin up a webserver on any Linux OS which supports the **Advanced Package Tool** ( apt )

ADWCD hosts an isolated apache2 web server on a docker image to host files.
The default http port is forwarded from **80** inside the container to **666** on the host.

ADWCD can : 
-----------
 
* Spin up an isolated apache2 container on a minimal debian image.

* Automaticly generate Firewall ( iptables ) rule 

* Purge all it's remaining files in case of removal

* Remove Iptables rule in case of removal

* Automaticly move web content files to the isolated apache2 directory 

* ( **not yet** ) Automaticly generate https certificates ( for a domain ) 

* ( **not yet** ) stop the container independently 

* ( **not yet** ) automaticly configure apache2 


Download & Installation
------------------------
* Download as tarball

`sudo wget https://github.com/FlorianB-AdrianS-AbdiA/ADWCD/archive/ADWCD.tar.gz`

Or clone the repository

`https://github.com/FlorianB-AdrianS-AbdiA/ADWCD.git`

------
* Run 

`sudo tar -xf ADWCD.tar.gz`

`sudo chmod +x deploy.sh`

`sudo ./deploy.sh`

License
--------
Code distributed under MIT licence.
