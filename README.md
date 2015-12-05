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
    remote    | host | user |        time         | method | path | code | size | referer |    agent
--------------+------+------+---------------------+--------+------+------+------+---------+-------------
 192.168.99.1 | -    | -    | 2015-12-05 09:06:09 | GET    | /    | 200  |  612 | -       | curl/7.43.0
(1 row)

pipeline=# \q
```
