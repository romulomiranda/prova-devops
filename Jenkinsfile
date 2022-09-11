pipeline {
    agent any
        
    environment {
        registryName = "containerprovadevops.azurecr.io/prova-devops"
        registryCredential = '032a0634-3632-4f4a-8c6e-c60bfdaf0f00'
        dockerImage = ""
        registryUrl = "containerprovadevops.azurecr.io"
        nameImage = "prova-devops"
        versionImage = "1.0"
    }
    
    stages {
        stage ('Acesso ao Projeto GitHub') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/romulomiranda/prova-devops']]])
            }
        }

        stage ('Build Docker Image') {
            agent {
                docker {
                    image registryName:versionImage
                }
            }
        }
        
        stage ('Test') {
            steps {
                sh 'go test -coverprofile=coverage.out ./...'
            }
        }

        stage('Upload Image to ACR') {
            steps{   
                script {
                    docker.withRegistry( "http://${registryUrl}", registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }   
}