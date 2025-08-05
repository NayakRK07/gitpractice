pipeline {
    agent any

    environment {
        IMAGE_NAME = 'rahulnumo/devops-portfolio'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/NayakRK07/gitpractice.git'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                docker build -t $IMAGE_NAME:$BUILD_NUMBER .
                docker push $IMAGE_NAME:$BUILD_NUMBER
                docker tag $IMAGE_NAME:$BUILD_NUMBER $IMAGE_NAME:latest
                docker push $IMAGE_NAME:latest
                '''
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                echo "Deploying using docker-compose from repo..."


                # Stop and remove any old containers
                docker compose down || true

                # Pull the latest image from Docker Hub
                docker compose pull

                # Start new container(s)
                docker compose up -d
                '''
            }
        }
    }

    post {
        success {
            echo "Build, Push & Deploy Successful!"
        }
        failure {
            echo "Pipeline Failed!"
        }
    }
}
