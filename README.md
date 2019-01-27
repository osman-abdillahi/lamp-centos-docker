# Lamp-Centos-Docker

Lamp-Centos-Docker is a dockerized lamp stack running on Centos : 6.7 

## Prerequisites

- Linux based OS (Ubuntu, Fedora, etc)
- Docker CE installed
- Git


## Build and Start container

Run the commands below to build and run the lamp CentOS container.


    docker build -t lamp-app .
    docker run -rm --name running-lamp-app lamp-app

