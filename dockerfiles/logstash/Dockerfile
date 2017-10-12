ARG ELASTIC_VERSION=5.6.2

FROM docker.elastic.co/logstash/logstash:${ELASTIC_VERSION}

RUN /usr/share/logstash/bin/logstash-plugin remove x-pack
RUN sed -i '/xpack/d' /usr/share/logstash/config/logstash.yml

COPY ./conf/* /conf/

CMD ["-f", "/conf", "-r"]
