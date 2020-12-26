FROM alpine

LABEL org.opencontainers.image.authors="Alan Ip <theipster@users.noreply.github.com>" \
    org.opencontainers.image.source="https://github.com/theipster/aws-cloudformation-graphviz"

# Init user, install packages
RUN addgroup -S app && \
    adduser -u 1001 -D -S -G app app && \
    apk add --no-cache gettext graphviz jq ttf-opensans

# Download AWS icon pack
RUN wget https://d1.awsstatic.com/webteam/architecture-icons/AWS-Architecture-Icons_PNG_20200430.1f43d2dd713164497d228e77bd7542ff7b504bd4.zip -O aws-png-icons.zip && \
    echo "1f43d2dd713164497d228e77bd7542ff7b504bd4  aws-png-icons.zip" > aws-png-icons.zip.sha1sum && \
    sha1sum -c aws-png-icons.zip.sha1sum && \
    mkdir /var/cache/aws-png-icons/ && \
    unzip -jnq aws-png-icons.zip -d /var/cache/aws-png-icons/ && \
    du -sc /var/cache/aws-png-icons/

# Copy executables
WORKDIR /etc/aws-cloudformation-graphviz
COPY src/ src
COPY templates/ templates

# Run tests
COPY tests.sh .
RUN ./tests.sh

# Link executables
RUN ln -s /etc/aws-cloudformation-graphviz/src/aws-cloudformation-graphviz.sh /usr/bin/aws-cloudformation-graphviz && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/edge.sh /usr/bin/aws-cloudformation-graphviz-edge && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/graph.sh /usr/bin/aws-cloudformation-graphviz-graph && \
    ln -s /etc/aws-cloudformation-graphviz/src/graphviz/node.sh /usr/bin/aws-cloudformation-graphviz-node

USER app
WORKDIR /home/app

ENTRYPOINT ["aws-cloudformation-graphviz"]
CMD ["-Tpng"]
