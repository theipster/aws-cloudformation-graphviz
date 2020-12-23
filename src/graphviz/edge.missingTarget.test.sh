#!/bin/sh
echo -n 'Edge is not generated when missing target'
expected='Missing association target.'
actual=`from=FooFunc how=Depends ./edge.sh`
test "$expected" = "$actual"
