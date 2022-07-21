#!/bin/bash

curl --silent --location https://rpm.nodesource.com/setup_16.x | bash -
yum install -y node

npm i --location=global typescript tsconfig-paths glob \
    @babel/core @babel/plugin-transform-runtime @babel/preset-env \
    babel-plugin-transform-runtime \
    babelify browserify tsify \
    chai mocha \
    gulp gulp-buffer gulp-concat vinyl-source-stream
