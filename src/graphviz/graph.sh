#!/bin/sh
DIR_TEMPLATES=/etc/aws-cloudformation-graphviz/templates

if [ -z "$title" ]; then
  echo "Missing graph title."
  exit 1
fi
if [ -z "$nodes" ]; then
  echo "Missing node contents."
  exit 1
fi
if [ -z "$edges" ]; then
  echo "Missing edge contents."
  exit 1
fi

main() {
  cat "$DIR_TEMPLATES/graph.gv" | envsubst
}

main
