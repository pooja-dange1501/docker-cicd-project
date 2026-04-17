pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ACCOUNT_ID = '123012261850'
        REPO = 'myapp-repo'
        IMAGE_TAG = "v${env.BUILD_NUMBER}"
    }

    stages {

        stage('Clone') {
            steps {
                echo "Cloning done"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp .'
            }
        }

        stage('Tag Image') {
            steps {
                sh '''
                docker tag myapp:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                '''
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO:$IMAGE_TAG
                '''
            }
        }
    }
}
