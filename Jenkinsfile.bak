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
                    def imageName = 'twimbit'
                    def dockerImage = docker.build(imageName, '-f Dockerfile .')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def portMapping = '80:80'
                    def containerName = 'twimbit-app'
                    
                    dockerImage.inside("-p ${portMapping} --name ${containerName}") {
              
                        // start  Nginx
                        sh 'nginx -g "daemon off;"'
                    }
                }
            }
        }
    }
}

