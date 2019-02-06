FROM alpine:3.6

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8080
ENV PASSWORD VcTz60crwwiANyU7PIQLaPspx
ENV METHOD none
ENV PROTOCOL auth_chain_b
ENV PROTOCOLPARAM none
ENV OBFS http_simple
ENV TIMEOUT 300
ENV DNS_ADDR 1.1.1.1
ENV DNS_ADDR_2 8.8.8.8

RUN apk --no-cache add python \
wget

RUN wget --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/manyuser.zip && unzip manyuser.zip && rm manyuser.zip

WORKDIR /shadowsocksr-manyuser/shadowsocks

EXPOSE $SERVER_PORT

CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G $PROTOCOLPARAM
