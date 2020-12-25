#!/bin/sh
echo -n 'Node is not generated when missing resource type'
expected='Missing resource type.'
actual=`id=FoobarFunc ./node.sh`
test "$expected" = "$actual"
