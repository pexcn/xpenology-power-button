#!/bin/sh

PATH_ACPID=/usr/bin/acpid

case "$1" in
    start)
        if [ -x "$PATH_ACPID" ]; then
            insmod /usr/lib/modules/evdev.ko
            insmod /usr/lib/modules/button.ko
            echo "start acpid"
            $PATH_ACPID
            logger -p daemon.info "$0 started acpid"
        fi
        ;;
    stop)
        echo "stop acpid"
        rmmod button
        rmmod evdev
        killall acpid > /dev/null 2>&1
        logger -p daemon.info "$0 stopped acpid"
        ;;
    *)
        echo "usage: $0 { start | stop }" >&2
        exit 1
        ;;
esac
