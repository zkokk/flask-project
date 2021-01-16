pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building in progress'
		slackSend (color: '#FFFF00', message: "Build step STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
		sh 'docker build -t "flaskapp:$GIT_COMMIT" .'
		echo 'Uploading to ECR Started!'
		sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 715071334032.dkr.ecr.us-east-2.amazonaws.com'
		sh 'docker tag flaskapp:$GIT_COMMIT 715071334032.dkr.ecr.us-east-2.amazonaws.com/flaskapp:$GIT_COMMIT'
		sh 'docker push 715071334032.dkr.ecr.us-east-2.amazonaws.com/flaskapp:$GIT_COMMIT'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing in progress'
		slackSend (color: '#FFFF00', message: "Test step STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying in progress'
		slackSend (color: '#FFFF00', message: "Deploy step STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
		sh "helm upgrade flaskapp helm/ --install --atomic --wait --set deployment.tag=$GIT_COMMIT"
            }
        }
    }
    post {
      success {
        slackSend (color: 'good', message: "Build SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
      }

      failure {
        slackSend (color: 'danger', message: "Build FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")   
      }
    }
}
