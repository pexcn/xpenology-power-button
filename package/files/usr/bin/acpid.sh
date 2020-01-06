#!/bin/sh

case "$1" in
    start)
        insmod /usr/lib/modules/evdev.ko
        insmod /usr/lib/modules/button.ko
        acpid -p /var/run/acpid.pid
        logger -p daemon.info "$0 started acpid"
        ;;
    stop)
        rmmod button
        rmmod evdev
        pkill -F /var/run/acpid.pid
        logger -p daemon.info "$0 stopped acpid"
        ;;
    *)
        echo "usage: $0 { start | stop }" >&2
        exit 1
        ;;
esac
