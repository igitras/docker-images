# Docker Image for Dockerui

# Set base image
FROM igitras/golang133

COPY src/dockerui.tar.gz /application/src/dockerui.tar.gz

RUN cd /application/src \
    && tar zxf dockerui.tar.gz

RUN cd /application/src \
    && mv dockerui /application/ \
    && cd /application/dockerui \
    && go build dockerui.go 


# Add binary to PATH
ENV PATH $PATH:/application/dockerui

ENTRYPOINT ["dockerui"]

EXPOSE 80

