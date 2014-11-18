#!/bin/bash

echo "Start Build activemq Image"
cd activemq && ./build.sh && cd ..

echo "Start Build rabbitmq Image"
cd rabbitmq && ./build.sh && cd ..

