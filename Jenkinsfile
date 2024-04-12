pipeline {
    agent any

    environment {
        SERVERLESS_ACCESS_KEY = credentials('e1ccff0b-58e7-483c-b502-f4c4c24916d4')
    }

    stages {
        stage('Install Serverless Framework') {
            steps {
                sh 'curl -o- -L https://slss.io/install | bash'
                sh 'export SERVERLESS_ACCESS_KEY = $SERVERLESS_ACCESS_KEY'
            }
        }

        stage('Package Serverless Services') {
            steps {
                sh 'sleep 100000'
                sh 'cd hello-service && echo "Packaging Hello Service..." && serverless package && cd ..'
                sh 'cd bye-service && echo "Packaging Bye Service..." && serverless package && cd ..'
                sh 'cd customer-service && echo "Packaging Customer Service..." && serverless package'
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
