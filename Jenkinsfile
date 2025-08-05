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

        stage('Build') {
            steps {
                sh 'echo "Building project..."'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                docker build -t $IMAGE_NAME:$BUILD_NUMBER .
                docker push $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

        stage('Deploy (Optional)') {
            steps {
                sh '''
                echo "Deploy step here - could be docker run or kubectl apply"
                '''
            }
        }
    }

    post {
        success {
            echo "Build and Push Successful!"
        }
        failure {
            echo "Build Failed!"
        }
    }
}
