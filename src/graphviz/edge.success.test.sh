#!/bin/sh
echo -n 'Edge can be successfully generated'
expected='"FooFunc" -> "BarFunc" [label="Depends", dir=none];'
actual=`from=FooFunc to=BarFunc how=Depends ./edge.sh`
test "$expected" = "$actual"
