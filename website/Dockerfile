FROM sysdia/docker-php-server

RUN apt-get -q -y update
RUN apt-get install -q -y openssh-server whois

#Set up sendmail for PHP
RUN rm /etc/msmtprc
RUN echo "defaults\n tls on\n tls_starttls on\n tls_trust_file /etc/ssl/certs/ca-certificates.crt\n account default\n host auth.smtp.myemail.co.uk\n port 587\n auth on\n user mailer@myemail.co.uk\n password <mypassword>\n from noreply@myemail.co.uk\n logfile /var/log/msmtp/msmtp.log" > /etc/msmtprc

#Set up Default web pages
RUN mkdir -p /var/www/mysite
RUN echo "<h1>Hello, World</h1><hr/>" > /var/www/mysite/index.html

#Set up Apache host
RUN rm /etc/apache2/sites-available/default
RUN echo "<VirtualHost *:80>\n ServerAdmin info@myemail.co.uk\n ErrorLog /var/log/apache2/error.log\n DocumentRoot /var/www/mysite\n <Directory \"/var/www/mysite\">\n Options Indexes MultiViews FollowSymLinks\n AllowOverride None\n Order allow,deny\n Allow from all\n </Directory>\n </VirtualHost>" >  /etc/apache2/sites-available/default

#Set up SSH Access
RUN mkdir /var/run/sshd
RUN adduser --home /home/remoteuser --shell /bin/bash --disabled-login remoteuser
RUN usermod -a -G sudo,adm remoteuser
ADD . .
RUN export REMOTEUSER_PASSWD=`tr -dc "[:alpha:]" < /dev/urandom | head -c 8`; export REMOTEUSER_PASSWD_HASH=`mkpasswd $REMOTEUSER_PASSWD`; usermod --password $REMOTEUSER_PASSWD_HASH remoteuser; echo "ssh with: ssh remoteuser@localhost and password: $REMOTEUSER_PASSWD"

#Initialise instance
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 22 80

CMD ["/usr/local/bin/run"]
