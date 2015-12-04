# ref. https://github.com/pipelinedb/pipelinedb/blob/0.8.1/pkg/docker/Dockerfile
FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
  
ENV LANG en_US.utf8

COPY scripts /scripts/

RUN /scripts/install_pipeline.sh

RUN /scripts/install_extras.sh

EXPOSE 5432

CMD ["/scripts/startpipeline"]

#USER pipeline
#RUN ["pipeline-ctl", "-D", "/mnt/pipelinedb/data", "-w", "start"]
#RUN ["psql", "-U", "pipeline", "-c", "CREATE DATABASE nginx"]
#RUN ["psql", "-U", "pipeline", "-c", "CREATE TABLE accesslogs (container_id text, container_name text, source text, log text);"]
#RUN ["pipeline-ctl", "-D", "/mnt/pipelinedb/data", "-w", "stop"]
