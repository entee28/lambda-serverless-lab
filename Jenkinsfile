pipeline {
    agent any

    stages {
        stage('Package Serverless Services') {
            steps {
                nodejs(nodeJSInstallationName: 'node') {
                    sh 'npm install'
                    sh 'npx serverless package'
                }
            }
        }

        stage('Deploy Serverless Services') {
            steps {
                nodejs(nodeJSInstallationName: 'node') {
                    sh 'npm install'
                    sh 'cd hello-service && echo "Deploying Hello Service..." && npx serverless deploy -p ./.serverless && cd ..'
                    sh 'cd bye-service && echo "Deploying Bye Service..." && npx serverless deploy -p ./.serverless && cd ..'
                    sh 'cd customer-service && echo "Deploying Customer Service..." && npx serverless deploy -p ./.serverless'
                }
            }
        }
    }
}
