pipeline {
    agent any

    environment {
        SERVERLESS_ACCESS_KEY = credentials('e1ccff0b-58e7-483c-b502-f4c4c24916d4')
    }

    stages {
        stage('Package Serverless Services') {
            steps {
                sh 'curl -o- -L https://slss.io/install | bash'
                sh 'echo $PATH'
                sh 'serverless deploy'
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
