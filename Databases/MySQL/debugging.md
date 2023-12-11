# Database Debugging

## See open connections to the database
[mysql: see all open connections to a given database?](https://stackoverflow.com/questions/1620662/mysql-see-all-open-connections-to-a-given-database)
```
mysql> SHOW PROCESSLIST;
+----+-----------------+------------------+-------------------------+---------+------+------------------------+------------------+
| Id | User            | Host             | db                      | Command | Time | State                  | Info             |
+----+-----------------+------------------+-------------------------+---------+------+------------------------+------------------+
|  5 | event_scheduler | localhost        | NULL                    | Daemon  |  733 | Waiting on empty queue | NULL             |
|  9 | root            | 172.19.0.1:43950 | cgc_certificate_tracker | Query   |    0 | init                   | SHOW PROCESSLIST |
+----+-----------------+------------------+-------------------------+---------+------+------------------------+------------------+
2 rows in set (0.00 sec)
```
OR
```
mysql> show status like '%onn%';
+-------------------------------------------------------+---------------------+
| Variable_name                                         | Value               |
+-------------------------------------------------------+---------------------+
| Aborted_connects                                      | 0                   |
| Connection_errors_accept                              | 0                   |
| Connection_errors_internal                            | 0                   |
| Connection_errors_max_connections                     | 0                   |
| Connection_errors_peer_address                        | 0                   |
| Connection_errors_select                              | 0                   |
| Connection_errors_tcpwrap                             | 0                   |
| Connections                                           | 9                   |
| Global_connection_memory                              | 0                   |
| Locked_connects                                       | 0                   |
| Max_used_connections                                  | 1                   |
| Max_used_connections_time                             | 2023-12-10 23:07:52 |
| Mysqlx_connection_accept_errors                       | 0                   |
| Mysqlx_connection_errors                              | 0                   |
| Mysqlx_connections_accepted                           | 0                   |
| Mysqlx_connections_closed                             | 0                   |
| Mysqlx_connections_rejected                           | 0                   |
| Performance_schema_session_connect_attrs_longest_seen | 113                 |
| Performance_schema_session_connect_attrs_lost         | 0                   |
| Ssl_client_connects                                   | 0                   |
| Ssl_connect_renegotiates                              | 0                   |
| Ssl_finished_connects                                 | 0                   |
| Threads_connected                                     | 1                   |
+-------------------------------------------------------+---------------------+
23 rows in set (0.01 sec)
```
