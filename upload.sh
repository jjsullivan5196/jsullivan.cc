#!/bin/sh

pandoc -t context -o static/resume.pdf content/resume/index.org
hugo
rclone sync public s3web:jsullivan.cc
