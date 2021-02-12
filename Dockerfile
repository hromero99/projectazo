FROM python:3.8 as base
WORKDIR /app
COPY requirements.txt /app/
RUN apt-get update && apt-get install -y python-virtualenv gunicorn &&\
    virtualenv -p python3 /app/venv && /app/venv/bin/pip3 install -r requirements.txt

FROM python:3.8
WORKDIR /app
COPY . /app
COPY --from=base /app/venv/ /app/venv
ENV GUNICORN_WORKERS=4
EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"]
