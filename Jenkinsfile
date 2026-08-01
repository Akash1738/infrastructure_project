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

        stage('Debug Workspace') {
            steps {
                sh '''
                    echo "Current Directory:"
                    pwd

                    echo "Workspace Files:"
                    ls -R
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Wait for EC2') {
            steps {
                sh 'sleep 60'
            }
        }

        stage('Configure EC2 with Ansible') {
            steps {
                dir('ansible') {
                    sh 'ansible -i inventory all -m ping'
                    sh 'ansible-playbook -i inventory playbook.yml'
                }
            }
        }

        stage('Verify Files') {
            steps {
                sh '''
                    pwd
                    ls -la

                    test -f Dockerfile
                    test -f index.html
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    docker build -t ${my-nginx} .
                """
            }
        }

        stage('Remove Old Container') {
            steps {
                sh """
                    docker rm -f ${webserver} || true
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                    docker run -d \
                        --name ${webserver} \
                        -p ${3000}:${80} \
                        ${my-nginx}
                """
            }
        }

        stage('Verify Deployment') {
            steps {
                sh """
                    sleep 5
                    docker ps
                    curl http://localhost:${3000}
                """
            }
        }
    }

    post {
        always {
            sh 'docker ps -a || true'
        }

        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}
