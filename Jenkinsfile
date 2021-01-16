def notifySlack(String buildStatus = 'STARTED') {
    // Build status of null means success.
    buildStatus = buildStatus ?: 'SUCCESS'

    def color

    if (buildStatus == 'STARTED') {
        color = '#D4DADF'
    } else if (buildStatus == 'SUCCESS') {
        color = '#BDFFC3'
    } else if (buildStatus == 'UNSTABLE') {
        color = '#FFFE89'
    } else {
        color = '#FF9FA1'
    }

    def msg = "${buildStatus}: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"

    slackSend(color: color, message: msg)
}

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building in progress'
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying in progress'
		sh "helm upgrade flaskapp helm/ --install --atomic --wait --set deployment.tag=$GIT_COMMIT"
            }
        }
    }
    notifySlack(currentBuild.result)
}
