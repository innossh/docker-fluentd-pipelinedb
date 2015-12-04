# docker-fluentd-pipelinedb

a sample docker containers for running Fluentd + pipelinedb

## Usage

```sh
$ docker-compose up -d
# request to nginx
$ curl http://<DOCKER_HOST>/

# wait a little...
$ psql -U pipeline -h<DOCKER_HOST> -p 5432 -W
Password for user pipeline:
psql (9.4.4)
Type "help" for help.

pipeline=# \pset pager off
Pager usage is off.
pipeline=# select * from accesslogs limit 1;
                           container_id                           |          container_name          | source |                                           log
------------------------------------------------------------------+----------------------------------+--------+------------------------------------------------------------------------------------------
 e086750445c4811a7bf07cf32f64af4c4afa6e2e66bb6f1df827f3ad5584a733 | /dockerfluentdpipelinedb_nginx_1 | stdout | 192.168.99.1 - - [04/Dec/2015:15:14:12 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.43.0"
(1 row)

pipeline=# \q
```
