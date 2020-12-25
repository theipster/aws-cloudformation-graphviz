#!/bin/sh
DIR_TEMPLATES=/etc/aws-cloudformation-graphviz/templates

if [ -z "$from" ]; then
  echo "Missing association source."
  exit 1
fi
if [ -z "$to" ]; then
  echo "Missing association target."
  exit 1
fi
how=${how:-}

main() {
  cat "$DIR_TEMPLATES/edge.gv" | envsubst
}

main
