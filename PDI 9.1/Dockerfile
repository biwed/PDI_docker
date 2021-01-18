FROM biwed/pdi-base:9.1


RUN apt-get update && \
    apt-get install -y \
    p7zip-full \
    git \
    && apt-get autoremove -y && apt-get clean all


WORKDIR /
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
