#!/bin/bash

source ../_generic_create.sh

function _ex() {


    touch empty.txt
    git add .
    git commit -m "chore: init repo"
    echo -e "#!/bin/sh\necho OK\n exit 0\n" > test.sh
    git add .
    git commit -am "adding tested feature"
    git tag -a 1.0.0 -m "Version 1.0.0"
    git push --tags -u origin master

    NB_COMMITS=$(head /dev/urandom | tr -dc 0-9 | head -c 2)
    echo ${NB_COMMITS}
    for i in `seq 1 ${NB_COMMITS}`;
    do
        head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10 >> test.sh
        git commit -am $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)
    done

    echo -e "#!/bin/sh\necho KO\n exit 0\n" > test.sh
    git commit -am "Breaking everything"
    NB_COMMITS=$(head /dev/urandom | tr -dc 0-9 | head -c 2)

    for i in `seq 1 ${NB_COMMITS}`;
    do
        head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10 >> test.sh
        git commit -am $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)
    done
    git push --tags -u origin master

    cd ..
    rm -rf work
    mkdir work
    cd work
    git clone ../repo . > /dev/null 2>&1

}

_create _ex
