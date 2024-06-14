pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.7/bin:$PATH"
    }
    stages {
        stage("Build") {
            steps {
                sh 'mvn clean deploy -e -X -DargLine="-Xmx4096m"'
            }
        }
        stage("SonarQube Analysis") {
            environment { 
                scannerHome = tool 'ziko-sonar-scanner'    
            }
            steps {
                withSonarQubeEnv('ziko-sonarqube-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-cred'
                }
            }
        }
    }
}

    


