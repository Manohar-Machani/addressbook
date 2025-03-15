pipeline {
   agent none
   tools {
      maven "mymaven"
   }
   environment {
       slave2_ip = "ec2-user@172.31.15.21"  // Fixed syntax
   }
   stages {
        stage('Compile') { 
            agent any
            steps {
                echo "Compiling the code..."
                sh "mvn compile"
            }
        }
        stage('UnitTest') { 
            agent { label 'Slave_1' }
            steps {
                echo "Running unit tests..."
                sh "mvn test"
            }
        }
        stage('Package') {
            agent { label 'Slave2' }  // Ensure Slave_2 is configured in Jenkins
            steps {
                script {
                    sshagent (credentials: ['Slave2']) {  // Ensure this matches Jenkins credentials ID
                        echo "Packaging the code..."
                        sh "scp -o StrictHostKeyChecking=no server-script.sh ${slave2_ip}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ${slave2_ip} 'bash ~/server-script.sh'"
                    }
                }
            }
        }
    }
}
