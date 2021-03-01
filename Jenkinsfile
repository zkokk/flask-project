pipeline {
    agent any
    environment {
	VERSION = '$GIT_COMMIT'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh 'docker build -t "myecr:$GIT_COMMIT" .'					
		echo "BUILD WAS SUCCESSFUL"
		}
        }
        stage('Push') {
            steps {
                echo 'Pushing to ECR..'
		sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 855051130134.dkr.ecr.eu-central-1.amazonaws.com'
		sh 'docker tag myecr:$GIT_COMMIT 855051130134.dkr.ecr.eu-central-1.amazonaws.com/myecr:$GIT_COMMIT'
		sh 'docker push 855051130134.dkr.ecr.eu-central-1.amazonaws.com/myecr:$GIT_COMMIT'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
		sh 'helm upgrade flaskapp helm/ --install --atomic --wait --set deployment.tag=$GIT_COMMIT'
            }
        }
    }
}
