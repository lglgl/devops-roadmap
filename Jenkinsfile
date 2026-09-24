pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm

                sh '''
                    echo "======================================"
                    echo "Git Repository"
                    echo "======================================"

                    echo "Current Commit:"
                    git rev-parse HEAD

                    echo ""
                    echo "Current Branch:"
                    git branch --show-current

                    echo ""
                    echo "Remote:"
                    git remote -v
                '''
            }
        }

        stage('Show Git Changes') {
            steps {
                sh '''
                    echo "======================================"
                    echo "Git Changed Files"
                    echo "======================================"

                    CURRENT_COMMIT=$(git rev-parse HEAD)

                    echo "Current commit:"
                    echo "$CURRENT_COMMIT"

                    echo ""

                    if [ -n "$GIT_PREVIOUS_SUCCESSFUL_COMMIT" ]; then

                        echo "Previous successful commit:"
                        echo "$GIT_PREVIOUS_SUCCESSFUL_COMMIT"

                        echo ""
                        echo "Changed files:"
                        git diff --name-status \
                            "$GIT_PREVIOUS_SUCCESSFUL_COMMIT" \
                            "$CURRENT_COMMIT"

                        echo ""
                        echo "Change statistics:"
                        git diff --stat \
                            "$GIT_PREVIOUS_SUCCESSFUL_COMMIT" \
                            "$CURRENT_COMMIT"

                    else

                        echo "No previous successful commit found."

                        echo ""
                        echo "Files in current commit:"
                        git show --name-status \
                            --format="" \
                            "$CURRENT_COMMIT"

                    fi
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