pipeline {
    agent any

    stages {
        stage('Checkout') {
                steps {
                    git credentialsId: 'a8948eea-cb0d-4a6f-a2f3-4ddf0b23d1b1',
                        url: 'https://github.com/sunilsinare/demo'
                }
            }
        stage("Build") {
          steps {
            git credentialsId: 'a8948eea-cb0d-4a6f-a2f3-4ddf0b23d1b1',
                url: 'https://github.com/sunilsinare/demo'
            withMaven {
              sh "mvn clean install"
            } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
          }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t demospringbootk8sjenkins:1.0 . "
                    sh "docker images "
                }
            }
        }

       stage('Deploy to Kubernetes') {
            steps {
                script {
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f service.yaml'
                  }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}