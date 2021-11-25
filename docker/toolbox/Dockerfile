FROM alpine
RUN apk add --no-cache wget curl busybox-extras netcat-openbsd python2 py-pip && \
     pip install awscli
RUN apk --purge -v del py-pip
CMD tail -f /dev/null
