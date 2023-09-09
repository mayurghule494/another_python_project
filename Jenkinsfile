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
            steps{                       	
	            sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'                		
	                echo 'Login Completed' 
                    sh 'docker push mayurghule/twimbit'   
                    sh 'docker logout'  
            }           
        }
    }
}
