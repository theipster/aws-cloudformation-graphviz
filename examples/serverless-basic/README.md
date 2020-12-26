# Serverless example

For projects using the [Serverless Framework](https://www.serverless.com/), the `serverless package` task (and by extension, the `serverless deploy` task) will generate a CloudFormation template at the relative path `.serverless/cloudformation-template-update-stack.json`.

This CloudFormation template can be used directly as input to `aws-cloudformation-graphviz` to generate an output diagram.

See [expected.png](expected.png) for the output of this particular example (verified by the test case [serverless.test.sh](serverless.test.sh)).
