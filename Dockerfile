FROM debian:stable-slim 

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y apache2
RUN apt-get install -y sudo

RUN apt-get -y autoremove && apt-get -y autoclean

RUN rm -R /var/www/html/*
COPY www /var/www/html
RUN service apache2 restart
CMD service apache2 restart

EXPOSE 80
EXPOSE 666

