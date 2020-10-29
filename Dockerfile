FROM python:3.6-alpine3.12
RUN apk update \
    && apk add git \
    && mkdir /app \
    && mkdir /app/config \
    && cd /app \
    && git clone https://github.com/zhongfly/telegram-bot-asf.git \
    && mv ./telegram-bot-asf/ ./ \
    && rm -rf ./telegram-bot-asf \
    && pip3 install -r requirements.txt
ENTRYPOINT ["python3", "telegram-asf.py", "/app/config/*"]
