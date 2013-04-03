#!/bin/bash
#
# 方便jekyll直接写作日志
#

cd ~/github/jiawulu.github.com

new_file=`rake post title="$1" | awk '{print $4}'`
echo "new file is $new_file"
vi $new_file
