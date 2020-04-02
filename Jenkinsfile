pipeline {
    agent any

    stages {
        stage('Checkout Git repository') {
	        steps {
                git branch: 'master', credentialsId: 'github' , url: 'git@github.com:nvaklinov/flask-project.git'
            }
        }

        stage('Build') {
            steps {	
                bash -x /var/lib/jenkins/scripts/pipeline.sh 
            }
        }
    }

    post {
        always {
	    /* Use slackNotifier.groovy from shared library and provide current build result as parameter */   
            slackNotifier(currentBuild.currentResult)
            cleanWs()
        }
    }
}
