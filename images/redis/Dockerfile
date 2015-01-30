FROM igitras/ubuntu

RUN apt-get update -y \
    && apt-get install -y wget build-essential \
    && apt-get -y upgrade \
    && mkdir /application/src -p \
    && cd /application/src \
    && wget http://download.redis.io/releases/redis-2.8.19.tar.gz \
    && tar xzf redis-2.8.19.tar.gz \
    && cd redis-2.8.19 \
    && make PREFIX=/application/redis install \
    && apt-get clean \
    && rm -Rf /application/src

# Add binary to PATH
ENV PATH $PATH:/application/redis/bin

ENTRYPOINT ["redis-server"]

EXPOSE 6379