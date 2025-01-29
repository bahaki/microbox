FROM python:3.10-alpine

WORKDIR /app

RUN apk update && \
    apk add --no-cache uhubctl && \
    apk add python3 py3-pip

RUN pip install --no-cache-dir --upgrade pip

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

CMD ["python", "microbox.py"]