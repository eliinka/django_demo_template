pipeline {
    agent none
    environment {
        IMAGE_NAME = 'elinka/django_demo'
    }
    stages {
        stage("deps") {
            agent {
                docker {
                    image 'python:latest'
                    args '-u root -v ${WORKSPACE}/pipenv:/root/.local'
                }
            }
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage("test") {
            agent {
                docker {
                    image 'python:latest'
                    args '-u root -v ${WORKSPACE}/pipenv:/root/.local'
                }
            }
            steps {
                sh 'python -m coverage run manage.py test'
            }
        }
        stage("report") {
            agent {
                docker {
                    image 'python:latest'
                    args '-u root -v ${WORKSPACE}/pipenv:/root/.local'
                }
            }
            steps {
                sh 'python -m coverage report'
            }
        }
        stage("build") {
            agent any
            steps {
                sh 'docker build . -t ${IMAGE_NAME}:%{GIT_COMMIT}'
            }
        }
    }
}