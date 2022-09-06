pipeline {
    agent any
        environment {
            registryName = "containerprovadevops.azurecr.io/prova-devops"
            registryCredential = '032a0634-3632-4f4a-8c6e-c60bfdaf0f00'
            dockerImage = ""
            registryUrl = "containerprovadevops.azurecr.io"
            nameImage = "prova-devops"
        }

        tools {
            go 'go1.14'
        }
    
    stages {
        stage ('Acesso ao Projeto GitHub') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/romulomiranda/prova-devops']]])
            }
        }

        stage('Pre Test') {
            steps {
                sh 'go run .'
            }
        }
            
        stage ('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build registryName
                }
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
        
        stage('stop previous containers') {
            steps {
                sh 'docker ps -f name=${nameImage} -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=${nameImage} -q | xargs -r docker container rm'
            }
        }
      
        stage('Docker Run') {
            steps{
                script {
                    sh 'docker run -d -p 5000:5000 --rm --name ${nameImage} ${registryName}'
                    }
            }
        }
   }   
}