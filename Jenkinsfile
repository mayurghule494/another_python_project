pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS_USR = credentials('Dockerhub_user').username
        DOCKERHUB_CREDENTIALS_PSW = credentials('Dockerhub_PSW').password
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mayurghule494/another_python_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image and tag it appropriately
                    sh 'docker build -t mayurghule/twimbit .'
                }
            }
        }

        stage('Login and Push') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials
                    sh "echo '$DOCKERHUB_CREDENTIALS_PSW' | docker login -u '$DOCKERHUB_CREDENTIALS_USR' --password-stdin"

                    // Push the Docker image to Docker Hub
                    sh 'docker push mayurghule/twimbit'
                }
            }
        }
    }
}
