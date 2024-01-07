
pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'my-docker-app'
        DOCKER_REGISTRY_URL = 'registry.example.com'  // Replace with your Docker registry URL
        DOCKER_IMAGE_TAG = "${env.BUILD_NUMBER}"  // You can customize the tagging strategy
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests if needed
                    // Example: docker run "${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" npm test
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {
                    // Push Docker image to registry
                    docker.withRegistry("https://${DOCKER_REGISTRY_URL}", 'docker-credentials') {
                        docker.image("${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy Docker image (example: using kubectl)
                    sh "kubectl set image deployment/my-app-deployment my-app=${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
