#!/bin/bash
pid=""
save_path=""
interval=0.5

while getopts "p:s:" opt 
do
    case $opt in
        p)
            pid=${OPTARG}
            ;;
        s)
            save_path=${OPTARG}
            ;;
        :) 
            echo "Option -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "Invdlia option: -${OPTARG} index:${OPTIND}"
            ;;
    esac
done

while true
do
    cmd="top -H -b -n1 | grep ${pid} | awk 'END{print \$1, \$9, \$12}'"
    result=$(eval ${cmd})
    date=$(date "+%T.%N")
    echo "${date} ${result}"
    echo "${date} ${result}" >> ${save_path}
    sleep ${interval}
done
