pipeline {
	agent any
	stages {
		stage("build") {
				steps {
					echo "STARTING BUILD"
					sh 'docker build -t "my_ecr:$GIT_COMMIT" .'					
					echo "BUILD WAS SUCCESSFUL"
					echo "UPLOADING TO THE ECR"					
					sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 146262318839.dkr.ecr.eu-central-1.amazonaws.com'					
					sh 'docker tag my_ecr:$GIT_COMMIT 146262318839.dkr.ecr.eu-central-1.amazonaws.com/my_ecr:$GIT_COMMIT'
					sh 'docker push 146262318839.dkr.ecr.eu-central-1.amazonaws.com/my_ecr:$GIT_COMMIT'
					sh 'helm upgrade flaskapp helm/ --install --atomic --wait --set deployment.tag=$GIT_COMMIT'
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
