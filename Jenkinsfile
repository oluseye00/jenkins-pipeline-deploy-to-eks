#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
	    AWS_DEFAULT_REGION="us-east-1"
	    THE_BUTLER_SAYS_SO=credentials('Cred-AWS')
    }
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/oluseye00/jenkins-pipeline-deploy-to-eks.git'
            }
        }
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init -reconfigure"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
