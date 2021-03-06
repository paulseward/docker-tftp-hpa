ARG VERSION=":notset"
ARG ARCH=":notset"
FROM $ARCH/alpine:$VERSION

RUN apk add --no-cache tftp-hpa \
    && mkdir /tftproot \
    && adduser -D tftp \
    && chown -R tftp /tftproot

EXPOSE 69/udp

CMD busybox syslogd -n -O /dev/stdout & exec in.tftpd -L -vvv --permissive --secure --create -u tftp /tftproot
