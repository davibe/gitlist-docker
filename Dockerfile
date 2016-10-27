FROM ubuntu:14.04
RUN apt-get update
RUN apt-get -y install git nginx-full php5-fpm curl
ADD https://s3.amazonaws.com/gitlist/gitlist-master.tar.gz /var/www/
RUN cd /var/www; tar -zxvf gitlist-master.tar.gz
RUN chmod -R 777 /var/www/gitlist
RUN cd /var/www/gitlist/; mkdir cache; chmod 777 cache
WORKDIR /var/www/gitlist/
ADD config.ini /var/www/gitlist/
ADD nginx.conf /etc/

RUN mkdir -p /repos/sentinel
RUN cd /repos/sentinel; git --bare init .

CMD service php5-fpm restart; nginx -c /etc/nginx.conf


