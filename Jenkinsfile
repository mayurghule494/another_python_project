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
                    // Build the Docker image and tag it appropriately
                    sh 'docker build -t mayurghule/twimbit .'
                }
            }
        }

        stage('Login and Push') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials
                    sh 'docker login -u mayurghule -p Happy@12345'

                    // Push the Docker image to Docker Hub
                    sh 'docker push mayurghule/twimbit'
                }
            }
        }
    }
}
