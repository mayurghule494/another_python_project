pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mayurghule494/another_python_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t twimbit .'
                }
            }
        }

        stage('Build Docker Image') {
            step {
                script{
                    sh 'docker login'
                    sh 'docker push twimbit:latest'
                }
            }

        }
        stage('Run Docker Container') {
            steps {
                script {:
                    sh 'docker run -d -p 80:80 twimbit:latest '
                    }
                }
            }
        }
    }
