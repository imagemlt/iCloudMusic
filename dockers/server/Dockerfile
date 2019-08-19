FROM nickistre/ubuntu-lamp
RUN apt-get update && apt-get install -y redis-server nginx php5-cli php5-cgi php5-fpm python-pip php5-redis
RUN apt-get install vim  -y
#RUN apt-get install libmysqld-dev -y
#RUN apt-get install python-mysqldb

#RUN pip install selenium

RUN rm -rf /usr/share/nginx/html/
RUN mkdir /usr/share/nginx/html/
RUN rm /etc/nginx/sites-available/default

#COPY ImageMusicServer-linux-x64 /usr/share/ImageMusicServer
COPY html /usr/share/nginx/html/
#COPY ./create.sql /tmp/
COPY default /etc/nginx/sites-available/
#COPY ./mybot.py /usr/share/

#RUN service mysql start && mysql -e "source /tmp/create.sql;" && mysql -e "update mysql.user set password=PASSWORD('D0n@77ouchMy5ql') where user='root';"
#RUN rm /tmp/*.sql
RUN chown -R root:root /usr/share/nginx/html/
RUN chmod -R 755 /usr/share/nginx/html/
#RUN chmod 777 /usr/share/nginx/html/keriCwylogggg.log
RUN service apache2 stop

#RUN useradd -m vault

COPY httpd-foreground /usr/bin
RUN chmod a+x /usr/bin/httpd-foreground
COPY redis.conf /etc/redis/
#COPY flag /
#COPY readflag /
#RUN RUN chmod a-r /flag && chmod 755 /readflag  && chmod u+s /readflag && chmod 777 /var/www/html/posts

EXPOSE 80
CMD ["httpd-foreground"]

#service nginx start && service php5-fpm start && service redis-server start && service mysql start && tail -f /var/log/nginx/error.log && /bin/bash
