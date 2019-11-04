#!/bin/sh

./gen.sh
rclone sync public s3web:jsullivan.cc
