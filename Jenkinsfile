pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'sudo apt install npm'
                sh 'npm test'
            }
        }

        stage("Build"){
            steps{
                sh 'npm run build'
            }
        }

        stage("Build Image"){
            steps{
                sh 'docker build -t mynodeapp:latest .'
            } 
        }

        stage("Docker Push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker_cred', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]){
                    sh 'docker login -u $DOCKERHUB_USERNAME -P $DOCKERHUB_PASSWORD'
                    sh 'docker tag mynodeapp:latest amiya777/mynodeapp:latest'
                    sh 'docker push amiya777/mynodeapp:latest'
                    sh 'docker logout'
                }
            }
        }
    }
}
