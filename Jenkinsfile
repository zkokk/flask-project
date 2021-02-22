pipeline {
    agent any
    environment {
	VERSION = '$GIT_COMMIT'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		 gitCommitHash = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
		 shortCommitHash = gitCommitHash.take(7)
  		 docker.build("$GIT_COMMIT")
            }
        }
        stage('Push') {
            steps {
                echo 'Pushing to ECR..'
		
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
