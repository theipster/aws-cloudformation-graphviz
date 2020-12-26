FROM alpine

LABEL org.opencontainers.image.authors="Alan Ip <theipster@users.noreply.github.com>" \
    org.opencontainers.image.source="https://github.com/theipster/aws-cloudformation-graphviz"

# Init user, install packages
RUN addgroup -S app && \
    adduser -u 1001 -D -S -G app app && \
    apk add --no-cache gettext graphviz jq ttf-opensans

# Download AWS icon pack
RUN wget https://d1.awsstatic.com/webteam/architecture-icons/AWS-Architecture-Icons_PNG_20200430.1f43d2dd713164497d228e77bd7542ff7b504bd4.zip -O aws-png-icons.zip && \
    echo "1f43d2dd713164497d228e77bd7542ff7b504bd4  aws-png-icons.zip" | sha1sum -c && \
    mkdir -v /var/cache/aws-png-icons/ && \
    unzip -jnq aws-png-icons.zip -x */.DS_Store */._* -d /var/cache/aws-png-icons/ && \
    du -sh /var/cache/aws-png-icons/ && \
    rm -v aws-png-icons.zip

# Copy executables
WORKDIR /etc/aws-cloudformation-graphviz
COPY examples/ examples/
COPY src/ src
COPY templates/ templates

# Link executables
RUN ln -s /etc/aws-cloudformation-graphviz/src/aws-cloudformation-graphviz.sh /usr/bin/aws-cloudformation-graphviz && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/edge.sh /usr/bin/aws-cloudformation-graphviz-edge && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/graph.sh /usr/bin/aws-cloudformation-graphviz-graph && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/node.sh /usr/bin/aws-cloudformation-graphviz-node

# Run tests
COPY tests.sh .
RUN ./tests.sh

USER app
WORKDIR /home/app

ENTRYPOINT ["aws-cloudformation-graphviz"]
CMD ["-Tpng"]
