#!/bin/bash
BUILD_VERSION=$1
DOCKER_IMAGE_NAME="axetay/ardunio-cli-esp32"

docker build . -t $DOCKER_IMAGE_NAME:$BUILD_VERSION    