# KStars Quickstart

## Create the Docker.kstars dockerfile

Specify `latest` to refer to the helxplatform/cloudtop:latest image tag.

```
../../CloudTopBuilder.py kstars.yml latest
```

Specify no second arg to get the default `develop-latest` image.
```
../../CloudTopBuilder.py kstars.yml
```

## Build the docker image
```
# development
docker build -f Docker.kstars -t wtstephens/cloudtop-kstars:0.1.2-dev .

# production
docker build -f Docker.kstars -t helxplatform/cloudtop-kstars:develop-latest .
docker build -f Docker.kstars -t helxplatform/cloudtop-kstars:0.1.1 .
```

## Run the image locally

Browse to localhost:8080 to interact with the image (essentially HTTP <--> VNC).

```
docker run -p 8080:8080 -e USER_NAME=myusername -e VNC_PW=mypassword wtstephens/kstarstest:latest
```
