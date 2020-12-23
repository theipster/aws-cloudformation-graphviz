#!/bin/sh
echo -n 'Node can be successfully generated'
expected=`cat <<'EXPECTED'
"FoobarFunc" ["label" = <
  <table border="0" cellpadding="2">
    <tr><td fixedsize="true" width="64" height="64"><img src="/var/cache/aws-png-icons/AWS-Lambda@4x.png" /></td></tr>
    <tr><td></td></tr>
    <tr><td><b>AWS::Lambda::Function</b></td></tr>
    <tr><td>FoobarFunc</td></tr>
  </table>
>];
EXPECTED
`
actual=`id=FoobarFunc type=AWS::Lambda::Function ./node.sh`
test "$expected" = "$actual"
