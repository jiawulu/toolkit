#!/bin/bash

echo "update base"
cd ~/www/base

git pull

echo "generate yuidoc"
cd taobao
grunt
yuidoc -c yuidoc.json .

echo "update container"
cd ~/www/container
git pull
git submodule foreach git checkout master
git submodule foreach git pull

cd plugins/cart
grunt

cd ../order
grunt

cd ../item
grunt


