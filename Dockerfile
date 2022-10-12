pipeline {
    agent none
    stages {
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
