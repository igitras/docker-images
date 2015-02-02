From igitras/java8

RUN mkdir /application/src -p

ENV VERSION 5.10.0

COPY src/apache-activemq-$VERSION-bin.tar.gz /application/src/apache-activemq-$VERSION-bin.tar.gz 

RUN cd application/src/ \
    && tar zxf apache-activemq-$VERSION-bin.tar.gz \
    && mv apache-activemq-$VERSION /application/activemq \
    && rm -Rf /application/src

EXPOSE 8161 5672 61613 61614 35822 61616 1883

ENV ACTIVEMQ_HOME /application/activemq
ENV PATH $ACTIVEMQ_HOME/bin:$PATH

CMD ["activemq", "console"]
