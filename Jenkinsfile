pipeline {
    agent any
    environment {
	VERSION = '$GIT_COMMIT'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh 'docker build -t "my_ecr:$GIT_COMMIT" .'					
		echo "BUILD WAS SUCCESSFUL"
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
