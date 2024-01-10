#!/usr/bin/env sh

pandoc --metadata-file resume.org.meta.yaml -o resume.pdf resume.org
