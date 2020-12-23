#!/bin/sh
BIN_EDGE=aws-cloudformation-graphviz-edge
BIN_GRAPH=aws-cloudformation-graphviz-graph
BIN_NODE=aws-cloudformation-graphviz-node
DIR_CLOUDFORMATION_JQ=/etc/aws-cloudformation-graphviz/src/cloudformation

edges() {
  jq --raw-output --from-file "$DIR_CLOUDFORMATION_JQ"/references.jq | xargs -I {} sh -c "{} $BIN_EDGE"
}

graph() {(
  export title=`echo "$1" | title`
  export nodes=`echo "$1" | nodes`
  export edges=`echo "$1" | edges`
  "$BIN_GRAPH"
)}

main() {
  local input=`cat <&0`
  graph "$input" | dot "$@"
}

nodes() {
  jq --raw-output --from-file "$DIR_CLOUDFORMATION_JQ"/resource_types.jq | xargs -I {} sh -c "{} $BIN_NODE"
}

title() {
  jq --from-file "$DIR_CLOUDFORMATION_JQ"/title.jq
}

main "$@" <&0
