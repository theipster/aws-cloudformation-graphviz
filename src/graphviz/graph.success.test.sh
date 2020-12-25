#!/bin/sh
echo -n 'Graph can be successfully generated'

stubTitle="FooGraph"
stubNodes='"BarNode" ["label" = < <span>BarNode</span> >];
  "BazNode" ["label" = < <span>BazNode</span> >];'
stubEdges='"BarNode" -> "BazNode" [label=Depends]'

expected=`cat <<'EXPECTED'
digraph FooGraph {
  graph [nodesep=0.5, ranksep=1.5]
  node [margin=0.15, shape=plaintext];

  "BarNode" ["label" = < <span>BarNode</span> >];
  "BazNode" ["label" = < <span>BazNode</span> >];

  "BarNode" -> "BazNode" [label=Depends]
}
EXPECTED
`
actual=`title="$stubTitle" nodes="$stubNodes" edges="$stubEdges" ./graph.sh`
test "$expected" = "$actual"
