# KStars Quickstart

## Create the Docker.scout dockerfile

Specify `latest` to refer to the helxplatform/cloudtop:latest image tag.

```
../../CloudTopBuilder.py scout.yml latest
```

Specify no second arg to get the default `develop-latest` image.
```
../../CloudTopBuilder.py scout.yml
```

## Build the docker image
```
# development
docker build -f Docker.scout -t wtstephens/cloudtop-scout:0.1.0-dev .

# production
docker build -f Docker.kstars -t helxplatform/cloudtop-scout:develop-latest .
docker build -f Docker.kstars -t helxplatform/cloudtop-scout:0.1.0 .
```

## Run the image locally

Browse to localhost:8080 to interact with the image (essentially HTTP <--> VNC).

```
docker run -p 8080:8080 -e USER_NAME=myusername -e VNC_PW=mypassword muralikarthik/scouttest:latest
```
