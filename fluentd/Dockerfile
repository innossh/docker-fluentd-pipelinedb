FROM fluent/fluentd:ubuntu-base

USER root

RUN apt-get update -y && apt-get install -y \
              libpq-dev \
        && rm -rf /var/lib/apt/lists/*

USER ubuntu

RUN ["gem", "install", "fluent-plugin-postgres", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-parser", "--no-rdoc", "--no-ri"]
