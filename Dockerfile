FROM alpine:latest

ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache curl tar openssl sudo bash jq python3 \
    && apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev \
    && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && apk add --no-cache nodejs \
    && curl -fsSL https://get.pulumi.com | sh \
    && pip3 install virtualenv \
    && python3 -m virtualenv /azure-cli \
    && mkdir /work \
    && /azure-cli/bin/python -m pip --no-cache-dir install azure-cli

COPY az /bin

RUN chmod 777 /bin/az

ENV PATH="/root/.pulumi/bin:${PATH}"

WORKDIR /work