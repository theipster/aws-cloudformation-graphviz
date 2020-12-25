#!/bin/sh
echo -n 'Edge is not generated when missing source'
expected='Missing association source.'
actual=`to=BarFunc how=Depends ./edge.sh`
test "$expected" = "$actual"
