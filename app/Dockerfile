FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
COPY wait-for-it.sh /wait-for-it.sh

# Install netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd

# Make the script executable
RUN chmod +x /wait-for-it.sh

CMD ["/wait-for-it.sh", "mysql", "3306", "--", "python", "app.py"]
