FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]

docker build -t myapp:v1 .
docker run -d -p 5000:5000 myapp:v1
