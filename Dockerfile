FROM python:3.8-slim as release

WORKDIR /app

EXPOSE 80

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN pip install markupsafe==2.0.1

COPY . .

ENTRYPOINT [ "python", "app.py" ]
