FROM mysql/mysql-server:latest

COPY my.cnf /etc/my.cnf
RUN chmod 0640 /etc/my.cnf \
    && mysql --version
