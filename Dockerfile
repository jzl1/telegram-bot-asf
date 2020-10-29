FROM python:3.6-alpine3.12
WORKDIR /app
RUN apk update \
    && apk add git gcc \
    && mkdir /app/config \
    && cd /app \
    && git clone https://github.com/zhongfly/telegram-bot-asf.git \
    && mv ./telegram-bot-asf/* ./ \
    && rm -rf ./telegram-bot-asf \
    && pip3 install -r requirements.txt \
    && apk del git gcc \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apk/* \
    && rm -rf /etc/apk/cache/* 
ENTRYPOINT ["python3", "telegram-asf.py", "/app/config/*"]
