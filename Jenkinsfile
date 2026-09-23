pipeline {

    // Jenkins Controller 执行
    agent any

    options {

        // Jenkins 不自动执行隐式 Checkout
        skipDefaultCheckout(true)

        // 禁止同一个 Job 并发执行
        disableConcurrentBuilds()
    }

    stages {

        // ====================================================
        // Checkout
        // ====================================================

        stage('Checkout') {

            steps {

                echo 'Checking out GitHub repository...'

                checkout scm

                sh '''
                    echo "======================================"
                    echo "Git Repository"
                    echo "======================================"

                    echo "Current directory:"
                    pwd

                    echo ""
                    echo "Current commit:"
                    git rev-parse HEAD

                    echo ""
                    echo "Current branch:"
                    git branch --show-current

                    echo ""
                    echo "Remote:"
                    git remote -v
                '''
            }
        }


        // ====================================================
        // Test
        // ====================================================

        stage('Test') {

            steps {

                sh '''
                    echo "======================================"
                    echo "Test"
                    echo "======================================"

                    echo "Repository updated successfully."

                    echo ""
                    echo "Files:"
                    find . -maxdepth 2 -type f | sort | head -100
                '''
            }
        }


        // ====================================================
        // Build
        // ====================================================

        stage('Build') {

            steps {

                echo 'Build stage is ready for future CI/CD steps.'

            }
        }
    }


    // ========================================================
    // Pipeline 完成
    // ========================================================

    post {

        success {

            echo '======================================'
            echo 'BUILD SUCCESS'
            echo '======================================'
        }

        failure {

            echo '======================================'
            echo 'BUILD FAILED'
            echo '======================================'
        }
    }
}