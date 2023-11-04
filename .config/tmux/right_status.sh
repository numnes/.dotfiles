#!/bin/bash

function date_time() {

    printf "%s " "$(date +'%Y-%m-%d %H:%M:%S')"

}

function main() {
    date_time
}


main
