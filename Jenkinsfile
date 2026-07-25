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
                sh 'docker build -t my-nginx .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f webserver || true
                docker run -d --name webserver -p 3000:80 my-nginx
                '''
            }
        }
    }
}
