#!/bin/sh
echo -n "Graph is not generated when missing nodes"

stubTitle='FooGraph'
stubEdges='"BarNode" -> "BazNode" [label=Depends]'

expected='Missing node contents.'
actual=`title="$stubTitle" edges="$stubEdges" ./graph.sh`
test "$expected" = "$actual"
