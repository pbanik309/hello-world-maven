pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE_NAME = "pbanik309/hello-world"
        GITHUB_REPO_URL = "https://github.com/pbanik309/hello-world-maven.git"
    }

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Fetch code
                git branch: 'master', url: "${GITHUB_REPO_URL}"
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven
                script {
                    sh 'docker --version'
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image
                script {
                    sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                // Login to Docker Hub
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker push ${DOCKER_IMAGE_NAME}:new'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
