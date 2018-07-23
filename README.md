# docker-kicad-build
Docker container with all dependencies to build the documentation for KITcar's PCBs.
This images utilizes the python API of pcbnew and eeshow.

The source is available at KITcar's Gitlab and a mirrored version at
[Github](https://github.com/KITcar-Team/docker-kicad-build), the build docker
image is available at
[Dockerhub](https://hub.docker.com/r/kitcar/docker-kicad-build/).


## Get Docker Image

Download the docker image with

```
docker pull kitcar/docker-kicad-build
```


## Build Docker Image

Build the docker image with:

```
docker build -t  kitcar/docker-kicad-build .
```


## Use the Docker Image to generate documenation

Clone the kitcar/kitcar-bus-system repository somewhere
Then run a docker container from the image:

```
docker run -it -v $PATH_TO_KITCAR_BUS_SYSTEM:/kitcar-bus-system kitcar/docker-kicad-build
```

Inside the container, you can document a PCB using:

```
cd /kitcar-bus-system/PCBs/
bash scripts/document_board.sh $PATH_TO_.pro_FILE $PATH_TO_OUTPUT_DIRECTORY 
```


## Update Docker Image

The Docker image will be updated after you push a new commit to a protected
branch at KITcar's Gitlab. The branch `master` is used for the tag `latest`,
other branches will create a Docker image tagged with the branch name.

Because some of our Gitlab Runners are low on hard drive memory, we should keep
an eye on the size of the Docker image.
