pipeline {

    agent any

    

    parameters {

        choice(name: 'ENVIRONMENT', choices: ['Production', 'Development', 'Test'], description: 'Select the environment')

    }


    stages {

        stage('Production') {

            when {

                expression { params.ENVIRONMENT == 'Production' }

            }

            steps {

                echo 'Code Deployed in Production environment!'

            }

        }


        stage('Development') {

            when {

                expression { params.ENVIRONMENT == 'Development' }

            }

            steps {

                echo 'Code Deployed in Development environment!'

            }

        }


        stage('Testing') {

            when {

                expression { params.ENVIRONMENT == 'Test' }

            }

            steps {

                echo 'Code Deployed in Test environment!'

            }

        }

    }

}
