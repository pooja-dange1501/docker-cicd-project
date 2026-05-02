# 🚀 Automated Docker CI/CD Pipeline (Jenkins + AWS ECR + Lambda)

---

## 📌 Overview  
This project demonstrates a complete CI/CD pipeline that automates Docker image build and deployment to Amazon ECR using Jenkins.  
An event-driven AWS Lambda function is triggered via EventBridge after every successful image push.

---

## 🧠 Architecture  

```
Developer (GitHub)
        │
        ▼
Jenkins Pipeline
(Build + Docker Image)
        │
        ▼
Amazon ECR
(Store Docker Image)
        │
        ▼
EventBridge Rule
(Detect Image Push)
        │
        ▼
AWS Lambda
(Trigger Automation)
        │
        ▼
CloudWatch Logs
(Logs / Monitoring)
```

---

## ⚙️ Tech Stack  

- Docker  
- Jenkins  
- AWS ECR  
- AWS Lambda  
- AWS EventBridge  
- CloudWatch  
- GitHub  

---

## 🔄 Pipeline Workflow  

1. Code pushed to GitHub  
2. Jenkins triggers pipeline  
3. Docker image is built  
4. Image is tagged & pushed to ECR  
5. EventBridge detects push event  
6. Lambda function executes  
7. Logs stored in CloudWatch  

---

## 🐳 Docker Setup  

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
```

---

## 🐍 Application Code  

```python
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Hello Pooja 🚀",
        "status": "CI/CD Pipeline Working Successfully"
    })

@app.route('/health')
def health():
    return jsonify({
        "status": "healthy"
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

---

## 📦 requirements.txt  

```
flask
```

---

## ⚙️ Jenkins Pipeline  

```groovy
pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ACCOUNT_ID = '123012261850'
        REPO_NAME = 'myapp-repo'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t pooja-app .'
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                docker tag pooja-app $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:latest
                docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:latest
                '''
            }
        }
    }
}
```

---

## ⚡ Lambda Function  

```python
import json

def lambda_handler(event, context):
    print("Image pushed to ECR")
    print(event)
    return {
        'statusCode': 200,
        'body': 'Success'
    }
```

---

## 🔔 EventBridge  

- Source: aws.ecr  
- Type: ECR Image Action  
- Action: PUSH  
- Target: Lambda  

---

## 📸 Screenshots  

- Jenkins Pipeline  
- ECR Images  
- Docker Container  
- Application Output  
- Lambda  
- EventBridge  
- CloudWatch Logs  

---

## 🚀 Run Locally  

```bash
docker build -t myapp .
docker run -d -p 8081:5000 myapp
```

---

## 📊 Sample Output  

```
🚀 ECR Image Push Detected!
```

---

## 🎯 Key Highlights  

- Automated CI/CD pipeline  
- Docker image versioning  
- AWS integration  
- Event-driven automation  

---

## 🔮 Future Scope  

- SNS Notifications  
- DynamoDB Logging  
- ECS Deployment  

---

## 👩‍💻 Author  

**Pooja Dange**  
Cloud & DevOps Learner  

📧 Email: poojadange1501@gmail.com  
🔗 LinkedIn: https://www.linkedin.com/in/pooja-dange-0270072b3  
💻 GitHub: https://github.com/pooja-dange1501/docker-cicd-project.git  

---
