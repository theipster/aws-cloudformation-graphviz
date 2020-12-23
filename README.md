# aws-cloudformation-graphviz

Tool to generate an architectural diagram from an AWS CloudFormation manifest.

Inspired by [trek10inc/cloudformation-graph](https://github.com/trek10inc/cloudformation-graph) and [nickshine/dot](https://github.com/nickshine/dot).

Icon set sourced from [AWS Architecture Center](https://aws.amazon.com/architecture/icons/).

## Usage

Pass the CloudFormation JSON contents via `STDIN`; receive the image file via `STDOUT`:

```sh
$ docker run -i --rm theipster/aws-cloudformation-graphviz < stack.json > stack.png
```

where arguments to the `docker run` command are the standard [GraphViz flags](https://graphviz.org/doc/info/command.html) (_default_: `-Tpng`).
