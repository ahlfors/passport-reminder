FROM alpine:3.20

RUN apk add --no-cache bash curl tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

COPY passport-notify.sh /usr/local/bin/passport-notify.sh
RUN chmod +x /usr/local/bin/passport-notify.sh

COPY crontab /etc/crontabs/root

CMD ["crond", "-f", "-l", "2"]