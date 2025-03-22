pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE_NAME = "pbanik309/hello-world"
        GITHUB_REPO_URL = "https://github.com/pbanik309/hello-world-maven.git"
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Fetch code from GitHub
                git branch: 'master', url: "${GITHUB_REPO_URL}"
            }
        }

        stage('Build with Maven') {
            steps {
                // Run Maven to build the project
                script {
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image from the Dockerfile in the project
                script {
                    sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                // Login to Docker Hub (Make sure Jenkins has credentials stored for this)
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker push ${DOCKER_IMAGE_NAME}'
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
