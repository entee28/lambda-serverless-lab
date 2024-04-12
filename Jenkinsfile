pipeline {
    agent {
        kubernetes {
            defaultContainer 'serverless'
            yamlFile 'serverless-jenkins.yaml'
        }
    }

    environment {
        SERVERLESS_ACCESS_KEY = credentials('e1ccff0b-58e7-483c-b502-f4c4c24916d4')
    }

    stages {
        stage('Package Serverless Services') {
            steps {
                sh 'export SERVERLESS_ACCESS_KEY=$SERVERLESS_ACCESS_KEY'
                sh 'cd hello-service && serverless package && cd ..'
                sh 'cd bye-service && serverless package && cd ..'
                sh 'cd customer-service && serverless package'
            }
        }

        stage('Deploy Serverless Services') {
            steps {
                sh 'export SERVERLESS_ACCESS_KEY=$SERVERLESS_ACCESS_KEY'
                sh 'cd hello-service && serverless deploy -p ./.serverless && cd ..'
                sh 'cd bye-service && serverless deploy -p ./.serverless && cd ..'
                sh 'cd customer-service && serverless deploy -p ./.serverless'
            }
        }
    }
}
