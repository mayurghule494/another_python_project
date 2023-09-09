pipeline {
    agent any

    environment {
        registryCredential = 'twimbit-dockerhub'
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
        
        stage('Push Docker Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
