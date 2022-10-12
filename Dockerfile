pipeline {
    agent none
    stages {
        stage('Zap') {
            agent {
                docker { image 'owasp/zap2docker-stable' }
            }
            steps {
                sh 'ls'
            }
        }
        stage('Nmap') {
            agent {
                docker { image 'instrumentisto/nmap' }
            }
            steps {
                sh 'nmap -V'
            }
        }
    }
}
