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
        aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 123012261850.dkr.ecr.ap-south-1.amazonaws.com
        docker tag pooja-app 123012261850.dkr.ecr.ap-south-1.amazonaws.com/myapp-repo:latest
        docker push 123012261850.dkr.ecr.ap-south-1.amazonaws.com/myapp-repo:latest
        '''
    }
}
    }
}