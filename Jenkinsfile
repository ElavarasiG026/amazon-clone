pipeline {
    agent any

    stages {
        stage('Serve Website') {
            steps {
                bat '''
                powershell -ExecutionPolicy Bypass -File serve.ps1
                '''
            }
        }
    }
}
