FROM mysql/mysql-server:latest

COPY my.cnf /etc/my.cnf
RUN chmod 0644 /etc/my.cnf \
    && ln -sf /proc/1/fd/1 /var/log/mysql-query.log \
    && ln -sf /proc/1/fd/1 /var/log/mysql-slow.log \
    && ln -sf /proc/1/fd/2 /var/log/mysql-error.log \
    && mysql --version
