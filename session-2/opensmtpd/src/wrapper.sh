#!/bin/sh -eux

setpriv --clear-groups --reuid _daemon_ --regid _daemon_ -- "$@"
