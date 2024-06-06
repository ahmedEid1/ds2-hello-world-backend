FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Install netcat (openbsd version)
RUN apt-get update && apt-get install -y netcat-openbsd

ENTRYPOINT ["/wait-for-it.sh", "database:3306", "--"]

CMD ["python", "app.py"]
