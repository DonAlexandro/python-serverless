FROM python:3.11.9-slim

COPY . /app/
WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    && apt-get clean \
    build-essential \
    python3-dev \
    python3-setuptools \
    gcc \
    make

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/python -m pip install pip --upgrade && \
    /opt/venv/bin/python -m pip install -r /app/src/requirements.txt

RUN apt-get remove -y --purge make gcc build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x ./src/entrypoint.sh

CMD ["./src/entrypoint.sh"]
