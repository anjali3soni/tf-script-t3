pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key')
    }
    stages {
        stage('Checkout Code') {
            steps {
                 git branch: 'main', url: 'https://github.com/anjali3soni/tf-script-t3.git'
            }
        }
        stage('Terraform Init') {
            steps {
                    sh 'terraform init'
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply --auto-approve '
                }
            }
        }
        
    }
    post {
        always {
            cleanWs()
        }
    }
} 