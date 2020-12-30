#!/usr/bin/env sh

pandoc --metadata-file content/resume/meta.yaml -o resume.pdf content/resume/index.org
