pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-nginx"
        CONTAINER_NAME = "webserver"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify') {
            steps {
                sh '''
                pwd
                ls -la
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t my-nginx .
                '''
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                docker rm -f webserver || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker run -d --name webserver -p 3000:80 my-nginx
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                docker ps
                curl http://localhost
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline Finished"
        }

        success {
            echo "Deployment Successful"
        }

        failure {
            echo "Deployment Failed"
        }
    }
}
