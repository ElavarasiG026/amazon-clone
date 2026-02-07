pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t amazon-clone .'
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                docker stop amazon-container || exit 0
                docker rm amazon-container || exit 0
                docker run -d -p 8081:80 --name amazon-container amazon-clone
                '''
            }
        }
    }
}
