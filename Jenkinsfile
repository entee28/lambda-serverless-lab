pipeline {
    agent any

    environment {
        SERVERLESS_ACCESS_KEY = credentials('e1ccff0b-58e7-483c-b502-f4c4c24916d4')
    }

    stages {
        stage('Package Serverless Services') {
            steps {
                nodejs(nodeJSInstallationName: 'node') {
                    sh 'npm install'
                    sh 'npx serverless deploy'
                }
            }
        }

        // stage('Deploy Serverless Services') {
        //     steps {
        //         nodejs(nodeJSInstallationName: 'node') {
        //             sh 'npm install'
        //             sh 'cd hello-service && echo "Deploying Hello Service..." && npx serverless deploy -p ./.serverless && cd ..'
        //             sh 'cd bye-service && echo "Deploying Bye Service..." && npx serverless deploy -p ./.serverless && cd ..'
        //             sh 'cd customer-service && echo "Deploying Customer Service..." && npx serverless deploy -p ./.serverless'
        //         }
        //     }
        // }
    }
}
