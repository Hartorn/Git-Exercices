#!/bin/bash

source ../_generic_create.sh

function _ex() {
    git checkout -b feature/add-12345
    touch empty.txt
    git add .
    git commit -m "chore: init repo"
    echo "one" >> first.txt
    echo "twi" >> second.txt
    echo "three" >> three.txt
    echo "four" >> four.txt
    echo "five" >> five.txtt
    echo "six seven" >> six.txt
    git add .
    git commit -m "First commit, with too much stuff and wrong message"
    echo "2" > second.txt
    git commit -am "fix: fixing second.txt"
    echo "two" > second.txt
    git commit -am "fix: really fixing second.txt"
    git push -u origin feature/add-12345

    cd ..
    mkdir work_remote
    cd work_remote
    git clone ../repo . > /dev/null 2>&1
    git checkout feature/add-12345
    mv five.txtt five.txt
    git add .
    git commit -m "fix: fixing five.txt filename"
    echo "six" > six.txt
    git commit -am "fix: fixing six.txt content"
    git push -u origin feature/add-12345

    cd ..
    rm -rf work_remote
    cd work
    git rm six.txt
    git commit -am "fix: removing unused six.txt"

}

_create _ex
