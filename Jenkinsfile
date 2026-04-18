pipeline {
    agent any

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

        stage('Remove Old Container') {
            steps {
                sh 'docker rm -f pooja-container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8081:5000 --name pooja-container pooja-app'
            }
        }
    }
}