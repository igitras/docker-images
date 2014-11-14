FROM igitras/build-base

RUN apt-get -y update && apt-get install -y erlang-dev

RUN mkdir /application/src -p

ENV VERSION 3.4.1

COPY src/rabbitmq-server-generic-unix-$VERSION.tar.gz /application/src/rabbitmq-server-generic-unix-$VERSION.tar.gz

RUN cd /application/src \
    && tar zxvf rabbitmq-server-generic-unix-$VERSION.tar.gz \
    && mv rabbitmq-server-generic-unix-$VERSION /application/rabbitmq \
    && rm -Rf /application/src

ENV RABBITMQ_HOME /application/rabbitmq

ENV PATH $RABBITMQ_HOME/sbin:$PATH

