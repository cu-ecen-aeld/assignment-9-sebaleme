#!/bin/sh

echo "Load LDD modules, exit on failure"


case "$1" in
  start)
        insmod /usr/bin/scull_load || exit 1
        insmod /usr/bin/module_load faulty || exit 1
        modprob hello || exit 1
        echo "Module started with success"
        ;;
  stop)
        rmmod /usr/bin/scull_unload || exit 1
        rmmod /usr/bin/module_unload faulty || exit 1
        rmmod hello || exit 1
        echo "Module stopped with success"
        ;;

  *)
        echo "Usage: "$1" {start|stop}"
        exit 1
esac

exit 0