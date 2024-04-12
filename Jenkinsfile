pipeline {
    agent any

    stages {
        stage('Install Serverless Framework') {
            steps {
                sh 'curl -o- -L https://slss.io/install | bash'
            }
        }

        stage('Package Serverless Services') {
            steps {
                sh 'serverless package'
            }
        }

        stage('Deploy Serverless Services') {
            steps {
                sh 'cd hello-service && echo "Deploying Hello Service..." && serverless deploy -p ./.serverless && cd ..'
                sh 'cd bye-service && echo "Deploying Bye Service..." && serverless deploy -p ./.serverless && cd ..'
                sh 'cd customer-service && echo "Deploying Customer Service..." && serverless deploy -p ./.serverless'
            }
        }
    }
}
