#!/bin/sh
echo -n "Graph is not generated when missing edges"

stubTitle='FooGraph'
stubNodes='"BarNode" ["label" = < <span>BarNode</span> >];
  "BazNode" ["label" = < <span>BazNode</span> >];'

expected='Missing edge contents.'
actual=`title="$stubTitle" nodes="$stubNodes" ./graph.sh`
test "$expected" = "$actual"
