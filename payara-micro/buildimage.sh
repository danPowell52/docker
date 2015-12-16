#!/bin/bash
IMAGE_NAME=payara:micro.4.1.153

docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]
then
    echo "Build failed!"
else
    echo "The payara-micro docker image has been built. To start a new container, execute: docker run -i -t payara:micro.4.1.1.154"
fi

