FROM python:3.7.3-alpine3.9 as base

FROM base
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt
COPY code /app/
WORKDIR /app
ENV LISTENING_PORT 80
EXPOSE 80
ENTRYPOINT ["python", "/app/main.py"]