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
        stage("build") {
            steps {
                sh 'mvn clean deploy -e -X -DargLine="-Xmx4096m"'
            }
        }
        stage("SonarQube Analysis"){
            steps {
            withSonarQubeEnv('ziko-sonarqube-server') {
                sh ''' $SCANNER_HOME/bin/ziko-sonar-scanner -Dsonar.projectName=twittetrend 
                 -Dsonar.projectKey=ziko01-key_twittertrend '''
            }
        }

    }
}
}

    


