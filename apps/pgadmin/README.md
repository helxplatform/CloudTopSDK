# chip690 Quickstart

## Create the Docker.pgadmin-cloudtop dockerfile

Specify `latest` to refer to the containers.renci.org/helxplatform/cloudtop:latest image tag.

```
../../CloudTopBuilder.py pgadmin-cloudtop.yml latest
```

Specify no second arg to get the default `develop-latest` image.
```
../../CloudTopBuilder.py pgadmin-cloudtop.yml
```

## Build the docker image
```
# development
docker build -f Docker.pgadmin-cloudtop -t containers.renci.org/helxplatform/cloudtop-pgadmin-cloudtop:0.1.2-dev .

# production
docker build -f Docker.pgadmin-cloudtop -t containers.renci.org/helxplatform/cloudtop-pgadmin-cloudtop:develop-latest .
docker build -f Docker.pgadmin-cloudtop -t containers.renci.org/helxplatform/cloudtop-pgadmin-cloudtop:0.1.1 .
```

## Run the image locally

Browse to localhost:8080 to interact with the image (essentially HTTP <--> VNC).

```
docker run -p 8080:8080 -e USER_NAME=myusername -e VNC_PW=mypassword containers.renci.org/helxplatform/pgadmin-cloudtop:latest
```
