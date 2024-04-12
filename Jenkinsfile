pipeline {
    agent any

    stages {
        stage('Package Serverless Services') {
            steps {
                nodejs(nodeJSInstallationName: 'node') {
                    sh 'npm config ls'
                    sh 'npm install -g serverless'
                    sh 'serverless package'
                }
            }
        }

        stage('Deploy Serverless Services') {
            steps {
                nodejs(nodeJSInstallationName: 'node') {
                    sh 'npm install -g serverless'
                    sh 'cd hello-service && echo "Deploying Hello Service..." && serverless deploy -p ./.serverless && cd ..'
                    sh 'cd bye-service && echo "Deploying Bye Service..." && serverless deploy -p ./.serverless && cd ..'
                    sh 'cd customer-service && echo "Deploying Customer Service..." && serverless deploy -p ./.serverless'
                }
            }
        }
    }
}
