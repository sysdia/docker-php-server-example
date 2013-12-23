Docker Image - PHP Server Example
======================================

This is an example Docker Image based on top of the PHP-Server Docker Image at the docker.io registry at:

https://index.docker.io/u/sysdia/docker-php-server/

The base image provides a PHP server running on apache with msmtp for sendmail support in PHP.

SSH support is also included to allow remote access to the Docker container when running.

Usage
------

# Getting Started

This example contains a run.sh script which will build the Docker Image and run it as a named container with the following ports exposed:

* Port 80 mapped to 5080 on the host machine: This is the web server port
* Port 22 mapped to 6022 on the host machine: This is the SSH remote access port

After running ./run.sh the output docker log will provide you a randomly generated SSH password to use for log in (search for the line "ssh with: ssh remoteuser@localhost and password:")

# Website

The website will be accessible via your host IP:5080 (the mapped port to port 80 of the Docker container)

* e.g. ```127.0.0.1:5080```
    * Should display a webpage saying ```Hello World```

# SSH Remote Access

To SSH into the Docker container you will need the randomly generated password which is output in the Docker build logs.

* Run the following command ```ssh remoteuser@localhost -p 6022```
* Accept any new key requests
* Enter password that was displayed at Docker build time
* You should now have access to the Docker container in the sudo and adm group

# Stopping Container

There is a helper script included called ./stop.sh which will stop the running container and remove the container.

Configuration
--------------

The build sets up a default configuration, which is probably ok for most basic uses. However, you will need to edit the msmtp config file as the one generated is just an example and sendmail won't work

* SSH into the Docker container
* Edit /etc/msmtprc
* Change the config file accordingly
