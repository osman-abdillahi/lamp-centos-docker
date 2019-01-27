# Lamp-Centos-Docker

Lamp-Centos-Docker is a dockerized lamp stack running on Centos : 6.5 

## Prerequisites

- Linux based OS (Ubuntu, Fedora, etc)
- Docker CE installed
- Git
- PHP 5.6
- Apache 2.3
- MySQL 5.6
- CentOS 6.5


## Build and Start container

Run the commands below to build and run the lamp CentOS container.


    docker build -t lamp-app .
    docker run -rm --name running-lamp-app lamp-app

