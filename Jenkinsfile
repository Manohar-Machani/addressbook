pipeline {
   agent none
   tools{
//     jdk "myjava"
      maven "mymaven"
   }
   environment {
   slave2_ip='ec2_user@172.31.15.21'
   }
    stages {
        stage('Compile') { //master
        agent any
            steps {
                echo "Compile the code"
                sh "mvn compile"
            }
        }
         stage('UnitTest') { //slave1
         agent {label 'Slave_1'}
            steps {
                echo "Test the code"
                sh "mvn test"
            }
        }
         stage('Package') {//salve2
          steps {
                script {
                sshagent (['Slave_2']){
                echo "Package the code"
                sh "scp -o StrictHostKeyChecking=no server-script.sh ${slave2_ip"}:/home/ec2-user"
                sh "ssh -o StrictHostKeyChecking=no ${slave2_ip"} 'bash ~/server-script.sh"
                    }
                }
            }
        }
    }
}
