#!/bin/sh
echo -n 'Node is not generated when missing resource id'
expected='Missing resource id.'
actual=`type=AWS::Lambda::Function ./node.sh`
test "$expected" = "$actual"
