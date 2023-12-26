pipeline {
    agent any
    environment {
      PROJECT_NAME = "Zion"
      OWNER_NAME   = "Vasili Pasmurtsev"
    }

    stages {
        stage('1-Build') {
            steps {
                // echo "Start of Stage Build..."
                // echo "Building......."
                // echo "End of Stage Build..."
                echo "---------------------------------------------------"
                sh " ls -la"
                sh "ssh jenkins@192.168.65.210  ls -a "
                sh "scp ./Dockerfile  jenkins@192.168.65.210:/home/jenkins"
                sh "ssh jenkins@192.168.65.210 cat Dockerfile"
                echo "---------------------------------------------------"
                //sh "ls -la"
                sh "exit"


            }
        }
        // stage('2-Test') {
        //     steps {
        //         echo "Start of Stage Test..."
        //         echo "Testing......."
        //         echo "Privet ${PROJECT_NAME}"
        //         echo "Owner is ${OWNER_NAME}"
        //         echo "End of Stage Build..."
        //     }
        // }
        // stage('3-Deploy') {
        //     steps {
        //         echo "Start of Stage Deploy..."
        //         echo "Deploying......."
        //         sh "ls -la"
        //         sh '''
        //            echo "Line1"
        //            echo "Line2"
        //         '''
        //         echo "End of Stage Build..."
        //     }
        // }
        // stage('4-Celebrate') {
        //     steps {
        //         echo "CONGRATULYACIYA!"
        //     }
        // }	
    }
}