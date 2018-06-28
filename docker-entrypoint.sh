#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpdox "$@"
elif [ "$1" = "/composer/vendor/bin/phpdox" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpdox" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
fi

exec "$@"
