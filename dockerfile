FROM postgres:16
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB glofox
COPY setup.sql /docker-entrypoint-initdb.d/