#!/bin/sh
echo -n 'Serverless CF output can generate a PNG image'
aws-cloudformation-graphviz -Tpng < .serverless/cloudformation-template-update-stack.json > actual.png
result=`diff expected.png actual.png`
test "$?" == 0
