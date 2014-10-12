#!/bin/bash

echo "Start Build Java6 Image"
cd java6 && ./build.sh && cd ..

echo "Start Build Java7 Image"
cd java7 && ./build.sh && cd ..

echo "Start Build Java8 Image"
cd java8 && ./build.sh && cd ..

