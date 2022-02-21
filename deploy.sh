#!/bin/bash -eu -o pipefail
rm -rf public/
hugo
aws s3 sync public/ s3://blog.evades.io --delete
