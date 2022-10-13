pipeline {
    agent none
    stages {
        stage('Zap') {
            agent {
                docker { 
                    image 'owasp/zap2docker-stable'
                    args '-u root --privileged'
                }
            }
            steps {
                sh 'zap-full-scan.py -t http://192.168.47.135 -U admin'
            }
        }
        stage('Nmap') {
            agent {
                docker { 
                    image 'instrumentisto/nmap'
                    args '-u root --privileged'
                }
            }
            steps {
                sh 'nmap -sT -p80 192.168.47.135'
            }
        }
    }
}
