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

   stage('Tag Image') {
    steps {
        sh '''
        COMMIT_ID=$(git rev-parse --short HEAD)
        docker tag pooja-app 123012261850.dkr.ecr.ap-south-1.amazonaws.com/myapp-repo:$COMMIT_ID
        docker push 123012261850.dkr.ecr.ap-south-1.amazonaws.com/myapp-repo:$COMMIT_ID
        '''
    }
}
    }
}