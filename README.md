# docker-fluentd-pipelinedb

a sample docker containers for running Fluentd + pipelinedb

## Usage

```sh
$ docker-compose up -d
# This could take a while.

# Request to nginx several times
$ curl http://<DOCKER_HOST>/

$ psql -U pipeline -h<DOCKER_HOST> -p 5432 -W
Password for user pipeline:
psql (9.4.4)
Type "help" for help.

pipeline=# \pset pager off
Pager usage is off.
pipeline=# select * from v_nginx_accesslogs;
       minute        |    path    | code | total_count
---------------------+------------+------+-------------
 2015-12-05 11:07:00 | /          | 200  |           5
 2015-12-05 11:08:00 | /test.html | 200  |           2
 2015-12-05 11:08:00 | /test      | 404  |           1
 2015-12-05 11:08:00 | /          | 200  |           1
(4 rows)

pipeline=# \q
```
