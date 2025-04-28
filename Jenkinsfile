pipeline {
    agent any

    environment {
        IMAGE_NAME = 'deepak3917/frontend-app'
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/deepakgitproject/forntend-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${DOCKER_TAG} ."
            }
        }

    // stage('Test Docker Image') {
    //         steps {
    //             script {
    //                 // Run the Docker container to test it locally
    //                 sh "docker run -d -p 3000:80 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${DOCKER_TAG}"
                    
    //                 // Optional: Check if the container is responding (you can modify this for more complex checks)
    //                 sh "curl http://localhost:3000"
    //             }
    //         }
    //     }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                    }
                    sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
