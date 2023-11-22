# Docker Cheatsheet
## Understanding DevOps and Docker
### DevOps Definition:

DevOps bridges the gap between Development and Operations, emphasizing communication, collaboration, continuous integration, quality assurance, and automated deployment.
### What is Docker?

Docker is a set of tools for delivering software in containers.
Containers are isolated packages of software.
Benefits of Containers:

### "Works on my machine" Problem:
Containers solve the issue of differences between development and production environments.

#### Isolated Environments:
Containers package applications with their dependencies, avoiding conflicts.
#### Development:
Docker facilitates running isolated applications, like databases, on a developer's machine.

#### Scaling:
Containers have low overhead, enabling quick scaling and load balancing.

### Containers vs. Virtual Machines:
Containers are more efficient than virtual machines as they have direct access to the host OS kernel and resources.

## Docker Basics
### Running Your First Container:
```bash
docker container run hello-world
```
### Listing Images:
```bash
docker image ls
```
### Listing Containers:

```bash
docker container ls

```
### Removing Containers
```bash
docker container rm <container_id or container_name>

```
### Stopping Containers:
```bash
docker container stop <container_id or container_name>

```
### Executing Commands Inside a Container:
```bash
docker container exec <container_id or container_name> <command>

```
### Removing Images:

```bash
docker image rm <image_id or image_name>

```
### docker image pull <image_name>

```bash
docker image pull <image_name>

```
### Running Container in Detached Mode:
```bash
docker container run -d <image_name>

```
## Docker Cleanup
### Removing All Containers:

```bash
docker container prune

```
### Removing Dangling Images:
```bash
docker image prune

```
System Prune (Clear Almost Everything)
```bash
docker system prune
```
## Common Docker CLI Commands (Shorthand)
### List Images:
```bash
docker images

```
### Remove Image:
```bash
docker rmi <image_id or image_name>

```
### List Containers:
```bash
docker ps -a

```
### Run Container:
```bash
docker run <image_name>

```
### Remove Container:
```bash
docker rm <container_id or container_name>

```
### Stop Container:
```bash
docker stop <container_id or container_name>

```
### Execute Command Inside Container:
```bash
docker exec <container_id or container_name> <command>

```

### Running an Ubuntu Container
```bash
docker run ubuntu
```

### Running an Interactive Ubuntu Container
```bash
docker run -it ubuntu
```

### Running a Detached Ubuntu Container
```bash
docker run -d -it --name looper ubuntu sh -c 'while true; do date; sleep 1; done'
```

### Viewing Container Logs
```bash
docker logs -f looper
```

### Pausing and Unpausing a Container
```bash
docker pause looper
```
```bash
docker unpause looper
```


### Attaching to a Running Container
```bash
docker attach looper
```

### Starting a Stopped Container with --no-stdin
```bash
docker start looper
```
```bash
docker attach --no-stdin looper
```

### Executing a Command Inside a Running Container
```bash
docker exec -it looper bash
```

### Running a Container with Automatic Removal
```bash
docker run -d --rm -it --name looper-it ubuntu sh -c 'while true; do date; sleep 1; done'
```

### Attaching to a Container and Detaching
```bash
docker attach looper-it
```



### Running command on the go
```bash
docker run -it --name website-input ubuntu sh -c 'while true; do
  echo "Input website:"; 
  read website; 
  echo "Searching.."; 
  sleep 1; 
  apt-get update 
  apt-get -y install curl 
  curl http://$website; 
done'
```


### Build an Image from Dockerfile
```bash
docker build -t myapp:latest .
```
# Sample Dockerfile
#### Dockerfile
```Dockerfile
FROM base_image:tag
WORKDIR /usr/src/app
COPY local_path .
RUN command
CMD command
```
### Inspect Image Details
```bash
docker inspect myapp:latest
```

### Tag an Image
```bash
docker tag myapp:latest myapp-prod:latest
```

### Create a Volume
```bash
docker volume create myvolume
```
### Create a Network
```bash
docker network create mynetwork
```

## ENTRYPOINT vs CMD
### ENTRYPOINT:

Specifies the main executable for the container.
### CMD:

Provides default arguments for the ENTRYPOINT or specifies the main command to be run if ENTRYPOINT is not specified.
## Combining ENTRYPOINT and CMD:

Helps create a flexible image with default behavior that can be overridden when running the container.
Handling Major and Minor Issues
## Major Issue:

Files staying in the container can be addressed by using docker cp to copy them to the host.
## Minor Issue:

The Dockerfile can be optimized to reduce the number of layers and, consequently, the image size.
# Docker Interaction: Volumes and Ports
## Volumes
To simplify storing downloads outside the container, Docker volumes can be used. Bind mounts allow you to mount a file or directory from the host machine into the container.

Example: Mounting the Current Folder
```bash
$ docker run -v "/src/app:/mydir" <image-name> 
```
The -v option creates a volume by mounting the current folder into the container at /mydir.
Changes made in the container are reflected on the host, and vice versa.
## Ports
Opening connections from the external world to a Docker container involves exposing and publishing ports.

### Exposing a Port in Dockerfile
Add the line EXPOSE <port> in the Dockerfile.

### Publishing a Port
Run the container with -p <host-port>:<container-port> to map host ports to container ports.

Example: Publishing Port
```bash
$ docker run -p 4567:3000 app-in-port
```
Maps host port 4567 to container port 3000.
Tip: Security Reminder
Define the host-side port to limit access, e.g., -p 127.0.0.1:3456:3000, allowing requests only from your computer.

# Migrating to Docker Compose
## sample compose file
```yaml
version: '3.8'
services:
  <service-name-1>:
    image: <username>/<repositoryname>
    build:
      context: .
    volumes:
      - .:/mydir
    container_name: <any-name>
    environment:
      - VARIABLE=VALUE
      - VARIABLE2=VALUE2
  <service-name-2>:
    image: jwilder/whoami
    ports:
      - 8000:8000
```
## Build the Docker image
```bash
docker compose build
```
## Push the Docker image to a registry
```bash
$ docker compose push
```
## Run a specific service defined in docker-compose.yml
```bash
$ docker compose run <service-name> <command>
```

## Run the entire multi-container application
```bash
$ docker compose up -d
```
# Docker Networking and Scaling
## Docker Networking
Docker networking allows connecting two services within Docker through a shared network. This enables containers to reference each other easily using service names. Here's an example of two services, webapp and webapp-helper, in a single network:
### sample compose file

```yaml
version: '3.8'

services:
  webapp:
    image: webapp-image
    networks:
      - my-network

  webapp-helper:
    image: webapp-helper-image
    networks:
      - my-network

networks:
  my-network:
```
In this example, webapp can access webapp-helper using the service name. The internal DNS handles the translation.

### Manual Network Definition
A network can be manually defined in a Docker Compose file. This is useful for sharing networks between containers defined in different Docker Compose files. Here's an example:
```yaml
version: '3.8'

services:
  db:
    image: backend-image
    networks:
      - database-network

networks:
  database-network:
    external:
      name: database-network

```
## Scaling
Compose can scale a service to run multiple instances:
```bash
$ docker compose up --scale whoami=3

```

## For reverse proxy refer the code

# Volumes in Action

In this section, we will set up a project management application (Redmine), a PostgreSQL database, and Adminer using Docker containers. This exercise focuses on using Docker Compose to manage the containers and introduces the concept of volumes for data persistence.

## Setting Up PostgreSQL

We will start by setting up PostgreSQL for our Redmine application. The official PostgreSQL image is used, and a Docker Compose file is provided to simplify the configuration.

```yaml
version: "3.8"

services:
  db:
    image: postgres:13.2-alpine
    restart: unless-stopped
    environment:
      POSTGRES_PASSWORD: example
    container_name: db_redmine
    volumes:
      - database:/var/lib/postgresql/data

volumes:
  database:
```
### You can inspect if a volume was created using the following command:
```bash
docker container inspect db_redmine | grep -A 5 Mounts
```
### You can check the named volume using:
```bash
docker volume ls
```
# Deployment Pipelines with Docker

Continuous Integration/Continuous Deployment (CI/CD) pipelines are fundamental in the DevOps workflow. GitLab defines CI/CD as a process that automates the manual steps required to get new code from a commit into production. In this section, we will set up a deployment pipeline using GitHub Actions and Watchtower for automatic deployment of containerized software.

## GitHub Actions Workflow

The GitHub Actions workflow is defined in the `.github/workflows/deploy.yml` file . Generally workflow is triggered on every push to the `master` branch and you can change it depending up on your interest.

```yaml
name:  Docker

on:
  push:
    branches:
      - master

jobs:
  deploy:
    name: Deploy to GitHub Pages
  
  publish-docker-hub:
    name: Publish image to Docker Hub
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          push: true
          tags: devopsdockeruh/coursepage:latest
```
 # Steps to push your image to Dockerhub 
```bash
 docker login
```
### Next, you will need to rename the image to include your username, and then you can push it:
```bash
 docker tag "image-name>:tag"  "username/repository "
```
### pushing
```bash
docker push "username/repository"
```

# Nginx reverse proxy issues 

### when we try reverse proxy nginx reverse proxy there might be something running on port 80
to check this out use this command...
```bash
 sudo lsof -i :80
```
to remove it temporarily use the following command
```bash
 sudo service apache2 stop
```
to restart it use
```bash
 sudo service apache2 start

```
### docker_key:
```bash
 dckr_pat_tjwpHwCgZpl0FwRdkpYna5BhlfI
 ```

# Steps to connect  EC2 

### firstly generate key then execute the following

```bash
 chmod 400 <keyname>.pem
```
```bash
 ssh -i <keyname>.pem <instance-user-name>@<public-ip or dns>
```
# Steps to connect Azure VM
```bash
 chmod 400 <keyname>.pem
```
```bash
 ssh -i <key>.pem azure_root@<public-ip>
```

# Unix Commands Cheat Sheet 

## Grep Commands
```bash
grep -i "UNix" geekfile.txt
grep -c "unix" geekfile.txt
grep -l "unix" f1.txt f2.txt f3.xt f4.txt
grep -w "unix" geekfile.txt
grep -o "unix" geekfile.txt
grep -n "unix" geekfile.txt
grep -v "unix" geekfile.txt
grep "^unix" geekfile.txt
grep "os$" geekfile.tx
grep –e "Agarwal" –e "Aggarwal" –e "Agrawal" geekfile.txt
grep -A1 learn geekfile.txt
```
## Tail Commands
```bash
tail -n 3 state.txt
tail +25 state.txt
tail -c -6 state.txt
tail -c +263 state.txt
tail -q state.txt capital.txt
```
# Sort Commands
```bash
sort -o file 2file
sort -r file
sort -k 2n file
sort -n file
sort -nr file
```
## Awk Commands
```bash
awk ‘{print}’ file
awk ‘/manager/{print}’ file
awk ‘{print $1,$3}’ file
awk ‘{print NR,$0}’ file
awk ‘{print NF}’ file
awk ‘NR==3 , NR==6 {print}’ file
awk ‘{print NR “-” $1}’
```
## Sed Commands
```bash
sed ‘s/unix/linux/’ file
sed ‘s/u/l/3’ file
sed ‘s/u/l/g’ file
sed ‘s/u/l3g’ file
sed ‘3 s/u/l/p’ file
sed -n ‘s/unix/l/p’ file
sed ‘1,3d’ file
sed ‘3,$d’ file
sed ‘nd’ fi
sed ‘3,5d’ file
sed ‘/sid/d’ file
```
## Cut Commands
```bash
cut -b 1-3,5-6 file
cut -b 1,2,3 file
cut -c 1,4,6 fil
cut -d “ ” -f 2 file --complement
```
## Echo and Variable Commands
```bash
echo ${#varname}
echo ${arr[0]}
echo ${#arr[@]} 
echo ${arr[@]:8}
echo ${arr[@]:3:4}
echo ${str:7}
echo ${str:1:4}
```
## If-Else Command
```bash
if [ $a == $b ]; then
  echo "a is equal to b"
else
  echo "a is not equal to b"
fi
```
## Case Command
```bash
CARS="bmw"
case "$CARS" in
  "mercedes") echo "Headquarters - Affalterbach, Germany" ;;
  "audi") echo "Headquarters - Ingolstadt, Germany" ;;
  "bmw") echo "Headquarters - Chennai, Tamil Nadu, India" ;;
esac
```
## For Loop Commands
```bash
for a in 1 2 3 4 5 6 7 8 9 10; do
  if [ $a == 5 ]; then
    break
  fi
  echo "Iteration no $a"
done
```

## While Loop Commands
```bash
while [ $a -lt 10 ]; do
  echo $a
  a=`expr $a + 1`
done
```

## For Loop with Array Commands
```bash
COLORS="red green blue"
for COLOR in $COLORS; do
  echo "COLOR: $COLOR"
done
```
## For Loop with Command Line Arguments Command
```bash
for SAMPLE in $@; do
  echo "The given sample is: $SAMPLE"
done
```

