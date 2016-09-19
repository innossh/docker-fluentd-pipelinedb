# docker-fluentd-pipelinedb

A sample of docker containers for running Fluentd + PipelineDB

## Requirements

- Docker Engine
  - docker-compose >= 1.6.0

## Usage

```sh
$ docker-compose up -d
Creating dockerfluentdpipelinedb_pipelinedb_1
Creating dockerfluentdpipelinedb_fluentd_1
Creating dockerfluentdpipelinedb_nginx_1
Creating dockerfluentdpipelinedb_pipelinedbslave_1

$ docker-compose ps
                  Name                                 Command               State                Ports
---------------------------------------------------------------------------------------------------------------------
dockerfluentdpipelinedb_fluentd_1           /bin/sh -c exec fluentd -c ...   Up      0.0.0.0:24224->24224/tcp
dockerfluentdpipelinedb_nginx_1             nginx -g daemon off;             Up      443/tcp, 0.0.0.0:80->80/tcp
dockerfluentdpipelinedb_pipelinedb_1        /scripts/startpipeline           Up      0.0.0.0:5432->5432/tcp
dockerfluentdpipelinedb_pipelinedbslave_1   /scripts/startpipeline           Up      5432/tcp, 0.0.0.0:6544->6544/tcp

$ docker-compose logs pipelinedbslave
Attaching to dockerfluentdpipelinedb_pipelinedbslave_1
pipelinedbslave_1  | Reading package lists...
...
pipelinedbslave_1  | LOG:  database system is ready to accept read only connections
pipelinedbslave_1  | FATAL:  could not start WAL streaming: ERROR:  replication slot "replicator_slot" does not exist
pipelinedbslave_1  |

# Start replication
$ psql -U pipeline -h 127.0.0.1 -p 5432 -c "SELECT * FROM pg_create_physical_replication_slot('replicator_slot');"
    slot_name    | xlog_position
-----------------+---------------
 replicator_slot |
(1 row)

# Request to nginx several times
$ curl -s http://127.0.0.1/ > /dev/null
$ curl -s http://127.0.0.1/test.html > /dev/null
$ curl -s http://127.0.0.1/foo > /dev/null

$ psql -U pipeline -h 127.0.0.1 -p 5432 -c "select * from v_nginx_accesslogs;"
       minute        |    path    | code | total_count
---------------------+------------+------+-------------
 2016-09-19 12:08:00 | /          | 200  |           3
 2016-09-19 12:09:00 | /foo       | 404  |           4
 2016-09-19 12:09:00 | /test.html | 200  |           2
(3 rows)

$ psql -U pipeline -h 127.0.0.1 -p 6544 -c "select * from v_nginx_accesslogs;"
       minute        |    path    | code | total_count
---------------------+------------+------+-------------
 2016-09-19 12:08:00 | /          | 200  |           3
 2016-09-19 12:09:00 | /foo       | 404  |           4
 2016-09-19 12:09:00 | /test.html | 200  |           2
(3 rows)
```
