pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Build docker image'
                script {
                    def customImage = docker.build("hardikshah1/jenkins:0.2")
                }
            }
        }
        stage('Publish image') {
            steps{
                echo 'Publishing image to docker hub'
                withDockerRegistry(credentialsId: 'docker-hub', url: "") {
                     sh 'docker push hardikshah1/jenkins:0.2'
                }
            }
        }
    }
}
