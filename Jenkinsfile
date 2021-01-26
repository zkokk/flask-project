pipeline {
	agent any
	stages {
		stage("build") {
				steps {
					echo "STARTING BUILD"
					sh 'docker build -t "flaskapp:$GIT_COMMIT" .'					
					echo "BUILD WAS SUCCESSFUL"
					echo "UPLOADING TO THE ECR"					
					sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 146262318839.dkr.ecr.eu-central-1.amazonaws.com'					
					sh 'docker tag flaskapp:$GIT_COMMIT 146262318839.dkr.ecr.eu-central-1.amazonaws.com/flaskapp:$GIT_COMMIT'
				}
		}
		stage("test") {
				steps {
					echo "STARTING TEST"
				}
		}
		stage("deploy") {
				steps {
					echo "STARTING DEPLOY"
				}
		}
	}
}
