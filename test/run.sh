#!/bin/bash

set -euf -o pipefail

container_name=$(echo boxer-test-`date +%s`)
boxer_path=$(pwd ../)

clean_up () {
    ARG=$?
    collect_logs
    echo "Cleaning up!"

    echo "Removing $container_name"
    lxc delete -f $container_name &> /dev/null
    exit $ARG
} 
trap clean_up EXIT

prepare_container() {
    echo "Starting $container_name"
    lxc launch ubuntu:xenial $container_name &> /dev/null

    wait_for_network

    mount_boxer
}

wait_for_network() {
    set +e +o pipefail

    OUTPUT=`lxc exec $container_name ip route get 8.8.8.8 2>/dev/null | awk '{print $NF; exit}' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`
    WAIT=4
    while [ "$OUTPUT" = "" ]; do 
        echo "Network isn't ready, waiting $WAIT more seconds"
        sleep $WAIT
        OUTPUT=`lxc exec $container_name ip route get 8.8.8.8 2>/dev/null | awk '{print $NF; exit}' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`
    done
    set -e -o pipefail
}

mount_boxer() {
    lxc config device add $container_name sdb disk source=$boxer_path path=/mnt/boxer &> /dev/null
}

bootstrap_system() {
    echo "Preparing system"
    # needs to be run as root
    lxc exec $container_name /mnt/boxer/scripts/bootstrap.sh
}

collect_logs() {
    echo "Collecting logs!"
    lxc exec $container_name cat /tmp/mnt/boxer/chef-stacktrace.out
}

prepare_container
bootstrap_system

collect_logs