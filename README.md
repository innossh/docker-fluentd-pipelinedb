# docker-fluentd-pipelinedb

a sample docker containers for running Fluentd + PipelineDB

## Requirements

- Docker Compose
  - docker-py >= 1.4.0

```
$ docker-compose version
docker-compose version: 1.5.1
docker-py version: 1.5.0
CPython version: 2.7.9
OpenSSL version: OpenSSL 1.0.2a 19 Mar 2015
```

## Usage

```sh
$ docker-compose up -d
# This could take a while.

# Start replication
$ psql -U pipeline -h <DOCKER_HOST> -p 5432 -c "SELECT * FROM pg_create_physical_replication_slot('replicator_slot');"
    slot_name    | xlog_position
-----------------+---------------
 replicator_slot |
(1 row)

# Request to nginx several times
$ curl http://<DOCKER_HOST>/

$ psql -U pipeline -h <DOCKER_HOST> -p 5432 -c "select * from v_nginx_accesslogs;"
       minute        |    path    | code | total_count
---------------------+------------+------+-------------
 2015-12-23 15:39:00 | /test.html | 200  |           1
 2015-12-23 15:39:00 | /test      | 404  |           1
 2015-12-23 15:39:00 | /          | 200  |           4
 2015-12-23 15:39:00 | /hoge      | 404  |           1
(4 rows)

$ psql -U pipeline -h <DOCKER_HOST> -p 6544 -c "select * from v_nginx_accesslogs;"
       minute        |    path    | code | total_count
---------------------+------------+------+-------------
 2015-12-23 15:39:00 | /test.html | 200  |           1
 2015-12-23 15:39:00 | /test      | 404  |           1
 2015-12-23 15:39:00 | /          | 200  |           4
 2015-12-23 15:39:00 | /hoge      | 404  |           1
(4 rows)
```
