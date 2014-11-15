FROM igitras/build-base

RUN apt-get -y update && apt-get install -y erlang

RUN mkdir /application/src -p

ENV VERSION 3.4.1

COPY src/rabbitmq-server-generic-unix-$VERSION.tar.gz /application/src/rabbitmq-server-generic-unix-$VERSION.tar.gz

RUN cd /application/src \
    && tar zxvf rabbitmq-server-generic-unix-$VERSION.tar.gz \
    && mv rabbitmq_server-$VERSION /application/rabbitmq \
    && rm -Rf /application/src \
    && /application/rabbitmq/sbin/rabbitmq-server --detached \
    && /application/rabbitmq/sbin/rabbitmq-plugins enable rabbitmq_management \
    && /application/rabbitmq/sbin/rabbitmqctl stop

ENV RABBITMQ_HOME /application/rabbitmq

ENV PATH $RABBITMQ_HOME/sbin:$PATH

EXPOSE 5672 15672 25672 4369

CMD ["rabbitmq-server"]

