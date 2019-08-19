FROM phusion/baseimage

RUN apt-get update && apt-get install -y libnss3 libgtk-3-common libxss1 libasound2 xvfb gtk2-engines-pixbuf xfonts-100dpi x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic 
RUN apt-get install vim  -y


COPY ImageMusicServer.tar.gz /usr/share/

RUN groupadd ciscn && \
	useradd -g ciscn ciscn -m && \
	password=$(openssl passwd -1 -salt 'abcdefg' '123456') && \
	sed -i 's/^ciscn:!/ciscn:'$password'/g' /etc/shadow


COPY httpd-foreground /usr/bin
RUN cd /usr/share/ && tar -zxv -f ImageMusicServer.tar.gz && chmod a+x /usr/bin/httpd-foreground

COPY fl4g_el3ctR0n /
COPY fl4g_el3ctR0n /flag
COPY readflag /
RUN  chmod 755 /fl4g_el3ctR0n && chmod 600 /flag && chmod 755 /readflag && chmod u+s /readflag && chmod a+s /readflag

#EXPOSE 80
CMD ["httpd-foreground"]

#service nginx start && service php5-fpm start && service redis-server start && service mysql start && tail -f /var/log/nginx/error.log && /bin/bash
