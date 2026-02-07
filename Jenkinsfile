pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t amazon-clone .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8081:80 amazon-clone'
            }
        }
    }
}
