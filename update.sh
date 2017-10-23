#!/usr/bin/env bash
cd bundle/

for i in `ls`; do
    echo "Updating $i"
    cd "$i"
    git pull
    cd ..
done

cd ..
