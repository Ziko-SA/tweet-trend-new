pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.7/bin:$PATH"
        MAVEN_OPTS = "-Xmx2048m"
    }
    stages {
        stage("build") {
            steps {
                sh 'mvn clean deploy'
            }
        }
    }
}

