pipeline {
    agent any

    stages {
        stage('Serve Website') {
            steps {
                bat '''
                echo Starting website server...
                python -m http.server 7070
                '''
            }
        }
    }
}
