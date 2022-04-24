docker run -it --rm \
  -v $(pwd):/app \
  -v $(pwd)/config/flink-conf.yaml:/flink/conf/flink-conf.yaml \
  --network flink_local \
  -e FLINK_PROPERTIES="jobmanager.rpc.address: jobmanager" \
  apache/seatunnel-flink --config /app/config/application.conf

# docker 容器内执行
bin/flink run --target local -Drest.port=8081 -Dtaskmanager.numberOfTaskSlots=2 -c org.apache.seatunnel.core.sql.SeatunnelSql seatunnel/seatunnel-core-sql-2.0.5-SNAPSHOT-2.11.8.jar --config seatunnel/application.conf