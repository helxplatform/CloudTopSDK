# KStars Quickstart

## Create the Docker.kstars dockerfile

Specify `latest` to refer to the helxplatform/cloudtop:latest image tag.

```
../../CloudTopBuilder.py kstars.yml latest
```

## Build the docker image
```
docker build -f Docker.kstars -t kstarstest .
```

## Run the image locally

Browse to localhost:8080 to interact with the image (essentially HTTP <--> VNC).

```
docker run -p 8080:8080 -e USER_NAME=myusername -e VNC_PW=mypassword kstarstest:latest
```
