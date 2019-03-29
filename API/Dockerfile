FROM python:3.7.3-alpine3.9 as base

FROM base as builder
WORKDIR /tmp
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

FROM python:alpine
COPY --from=builder /usr/local/lib/ /usr/local/lib/
COPY code /app/
WORKDIR /app
ENV LISTENING_PORT 80
EXPOSE 80
ENTRYPOINT ["python", "/app/main.py"]