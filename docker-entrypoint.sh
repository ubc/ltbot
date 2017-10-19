#!/usr/bin/env sh

set -eo pipefail

# if command starts with an option, prepend mysqld
if [ "${1:0:1}" = '-' ]; then
	set -- errbot "$@"
fi

mkdir -p /srv/data /srv/plugins


exec "$@"