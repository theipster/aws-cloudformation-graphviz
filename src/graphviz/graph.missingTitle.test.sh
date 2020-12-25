#!/bin/sh
echo -n "Graph is not generated when missing title"

stubNodes='"BarNode" ["label" = < <span>BarNode</span> >];
  "BazNode" ["label" = < <span>BazNode</span> >];'
stubEdges='"BarNode" -> "BazNode" [label=Depends]'

expected='Missing graph title.'
actual=`nodes="$stubNodes" edges="$stubEdges" ./graph.sh`
test "$expected" = "$actual"
