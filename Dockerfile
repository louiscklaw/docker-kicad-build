FROM ubuntu:16.04
LABEL name=docker-kicad-build version=latest

# install KiCAD 4.0.7
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:js-reynaud/kicad-4 
RUN apt-get update
RUN apt-get install -y kicad

# install python
RUN apt-get install python2.7

# build and install eeshow
RUN apt-get install -y libgtk-3-dev libcairo2-dev libgit2-dev transfig imagemagick git make
RUN git clone http://neo900.org/git/eeshow
RUN cd eeshow && make && make install
