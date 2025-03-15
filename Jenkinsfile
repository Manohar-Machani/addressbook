pipeline {
   agent none
   tools{
//     jdk "myjava"
  //    maven "mymaven"
   }
    stages {
        stage('Compile') { //master
        agent any
            steps {
                echo "Compile the code"
               // sh "mvn compile"
            }
        }
         stage('UnitTest') { //slave1
         agent {label 'Slave_1'}
            steps {
                echo "Test the code"
             //   sh "mvn test"
            }
        }
         stage('Package') {//master
        agent any
            steps {
                echo "Package the code"
              //  sh "mvn package"
            }
        }
    }
}
