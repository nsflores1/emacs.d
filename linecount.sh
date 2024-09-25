#!/bin/sh

t=$(cat *.el lisp/*.el | grep -v -e '^\ *$' -e '^;' | \
      wc -l)
echo Line count: ${t}
