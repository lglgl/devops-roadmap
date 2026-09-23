pipeline {

    agent any

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm

                sh '''
                    echo "======================================"
                    echo "Git Repository"
                    echo "======================================"

                    echo "Commit:"
                    git rev-parse HEAD

                    echo ""
                    echo "Branch:"
                    git branch --show-current

                    echo ""
                    echo "Remote:"
                    git remote -v
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    echo "======================================"
                    echo "Test"
                    echo "======================================"

                    echo "Repository checkout successful."

                    find . -maxdepth 2 -type f | sort | head -100
                '''
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage completed.'
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully.'
        }

        failure {
            echo 'CI pipeline failed.'
        }
    }
}