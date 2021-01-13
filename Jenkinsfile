pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh 'docker build -t "flaskapp:$GIT_COMMIT" .'
		echo 'Uploading to ECR Started!'
		sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 715071334032.dkr.ecr.us-east-2.amazonaws.com'
		sh 'docker tag flaskapp:$GIT_COMMIT 715071334032.dkr.ecr.us-east-2.amazonaws.com/flaskapp:$GIT_COMMIT'
		sh 'docker push 715071334032.dkr.ecr.us-east-2.amazonaws.com/flaskapp:$GIT_COMMIT'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
