#!/bin/sh

# Why using overlay instead of makefile install?
# Answer from chatGPT:
# Overlays are an excellent choice for simple, static file placement,
# offering simplicity and clarity. Makefile install commands are more
# appropriate for complex software installation and build processes.
# Using the right approach based on your project requirements can greatly

streamline your Buildroot experience.
echo "Load AESDCHAR module, exit on failure"


case "$1" in
  start)
        /usr/bin/aesdchar_load || exit 1
        echo "AESDCHAR Module started with success"
        ;;
  stop)
        /usr/bin/aesdchar_unload || exit 1
        echo "AESDCHAR stopped with success"
        ;;

  *)
        echo "Usage: "$1" {start|stop}"
        exit 1
esac

exit 0