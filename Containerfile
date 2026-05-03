FROM alpine:latest

RUN apk add python3 py3-pillow ffmpeg setpriv fuse3 fuse2fs

RUN adduser -D app
USER app
WORKDIR /home/app

RUN python3 -m venv .venv
RUN source ./.venv/bin/activate && pip install copyparty
RUN wget https://github.com/9001/copyparty/raw/refs/heads/hovudstraum/bin/hooks/msg-log.py
COPY run.sh copyparty.conf .

CMD sh run.sh
