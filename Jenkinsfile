pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'https://hub.docker.com/'
        DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
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
            steps {
                script {
                    // Authenticate with the Docker registry using credentials
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKERHUB_CREDENTIALS}") {
                        // Push the Docker image to the registry
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
