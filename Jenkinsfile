pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-nginx"
        CONTAINER_NAME = "webserver"
        HOST_PORT = "3000"
        CONTAINER_PORT = "80"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Files') {
            steps {
                sh '''
                echo "Current Directory:"
                pwd

                echo "Workspace Files:"
                ls -la

                test -f Dockerfile
                test -f index.html
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

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                  --name webserver \
                  -p 3000:80 \
                  my-nginx
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                sleep 5

                docker ps

                echo "Checking application..."

                curl http://localhost:3000
                '''
            }
        }
    }

    post {
        always {
            sh 'docker ps -a || true'
        }

        success {
            echo "Deployment Successful"
        }

        failure {
            echo "Deployment Failed"
        }
    }
}
