pipeline {
    agent {
        docker {
            image 'python:latest'
            args '-u root'
        }
    }
    stages {
        stage("deps") {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage("test") {
            steps {
                sh 'python -m coverage run -m nose2'
            }
        }
        stage("report") {
            steps {
                sh 'python -m coverage report'
                }
         }
    }
}