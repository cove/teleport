#!/usr/bin/env bash

set -x
set -e
echo "" > coverage.txt

for d in $(go list ./... | grep -v vendor | grep -v /examples |grep -v /integration); do
    go test -coverprofile=profile.out -covermode=atomic $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done
