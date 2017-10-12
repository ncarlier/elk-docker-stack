# ELK Docker stack

## Description

A simple Docker stack to illustrate the usage of ELK as log concentrator tool.

Logstash act as a rsyslog collector and forward logs into Elasticsearch.
Kibana uses Logtrail in order to visualise logs.

## Prerequisites

Ensure that the host is able to run Elsaticsearch:

```bash
$ sudo sysctl vm.max_map_count
$ # If the value is inferior to 262144, you have to adjust it:
$ sudo sysctl -w vm.max_map_count=262144
```

## Usage

Deploy the stack:

```bash
$ make deploy
```


Deploy another container using syslog as logging driver:

```bash
$ cd sample
$ make deploy
$ for ((i=1;i<=100;i++)); do curl "localhost"; done
```

Open Kibana (`http://localhost:8080`) and navigate to LogTrail to see the result.

If your browser tells you that the connection was reset, be patient, Kibana is a
bit long to start.


> Use `make help` to see other available commands.

---
