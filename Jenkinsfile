pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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
        
		stage('Docker Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push Image') {

			steps {
				sh 'docker push mayurghule/twimbit:latest'
			}
		}

        stage('Deploy Docker Image') {
            steps {
                script {
                    // Build the Docker image and tag it appropriately
                    sh 'docker run -d -p 80:80 mayurghule/twimbit'
                }
            }
        }

    }
}
