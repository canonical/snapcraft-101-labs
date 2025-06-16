#!/bin/sh

set -e

PERLLIB="$SNAP/usr/share/perl/5.38"
PERLLIB="${PERLLIB}:${SNAP}/usr/lib/x86_64-linux-gnu/perl/5.38"
PERLLIB="${PERLLIB}:${SNAP}/usr/lib/x86_64-linux-gnu/perl/perl-base"
PERLLIB="${PERLLIB}:${SNAP}/etc/perl"
export PERLLIB

for subdir in cache/uploads logs; do
  [ -d "${SNAP_COMMON}/${subdir}" ] ||
    mkdir -p "${SNAP_COMMON}/${subdir}"
done

# From the lighttpd man page:
#   -D: Do not daemonize (go into background). The default is to daemonize. 
exec "${SNAP}/usr/sbin/lighttpd" \
  -D \
  -f "/etc/lighttpd/lighttpd.conf"
