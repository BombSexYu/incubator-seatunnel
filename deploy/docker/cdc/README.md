# Quick Start

MySQL: 集成了 MySQL 8.0.22，已自动开启binlog；

Elasticsearch: 主要存储 CDC 产出的数据； 

Kibana: 可视化 Elasticsearch 中的数据；
```shell
# 启动所有的容器
docker-compose up --force-recreate -d

# 拷贝文件进docker容器
docker cp .\docker\seatunnel-core-sql-2.0.5-SNAPSHOT-2.11.8.jar f43a74635f01:/opt/flink/seatunnel/seatunnel-core-sql-2.0.5-SNAPSHOT-2.11.8.jar
docker cp .\docker\application.conf f43a74635f01:/opt/flink/seatunnel/application.conf

# 执行任务
bin/flink run --target local -Drest.port=8081 -Dtaskmanager.numberOfTaskSlots=1 -c org.apache.seatunnel.core.sql.SeatunnelSql seatunnel/seatunnel-core-sql-2.0.5-SNAPSHOT-2.11.8.jar --config seatunnel/application.conf
```

This command starts 2 containers, one is to to write data into a file, which serves as a datasource, the other container
is SeaTunnel.

From the logs, you can see the data file is read and parsed into structured table rows.
