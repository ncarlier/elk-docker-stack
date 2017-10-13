ARG ELASTIC_VERSION=5.6.2

FROM docker.elastic.co/kibana/kibana:${ELASTIC_VERSION}

ARG ELASTIC_VERSION
ARG LOGTRAIL_VERSION=0.1.21

# Add LogTrail kibana plugin
RUN kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v${LOGTRAIL_VERSION}/logtrail-${ELASTIC_VERSION}-${LOGTRAIL_VERSION}.zip

# Install logtrail configuration
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json

