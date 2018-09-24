pipeline {
    agent {
        docker {
          image 'ppodgorsek/robot-framework'
          args '-v ./tests/:/opt/robotframework/tests/:Z -v ./reports:/opt/robotframework/reports:Z -e --shm-size=1g'
        }
    }
    environment {
        GIT_BRANCH = "${GIT_BRANCH}"
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
    }
    stages {
        stage('Up Worspace') {
            steps {
                sh """
                echo 'Pulling requirements ... ' + ${env.GIT_BRANCH}
                pip install -U -r requirements.txt
                docker pull ppodgorsek/robot-framework
                """
            }
        }
        stage('Execute tests') {
            steps {
                sh """
                docker run -v ./tests/:/opt/robotframework/tests/:Z -v ./reports:/opt/robotframework/reports:Z -e --shm-size=1g ppodgorsek/robot-framework
                """
            }
        }
    }
}
