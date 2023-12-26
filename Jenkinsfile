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
                sh "export http_proxy=http://172.16.10.29:8080/" 
                sh "export https_proxy=http://172.16.10.29:8080/"
                sh "export no_proxy=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 "
                sh "export HTTP_PROXY=http://172.16.10.29:8080/ "
                sh "export HTTPS_PROXY=http://172.16.10.29:8080/ "
                sh "export NO_PROXY=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 "
                sh "ssh jenkins@192.168.65.210  ls -a "
                sh "scp ./index.php  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./Dockerfile  jenkins@192.168.65.210:/home/jenkins"
                sh "ssh jenkins@192.168.65.210 cat Dockerfile"
                sh """
                ssh jenkins@192.168.65.210 sudo -E docker build \
--build-arg http_proxy=http://172.16.10.29:8080/ \
--build-arg https_proxy=http://172.16.10.29:8080/ \
--build-arg no_proxy=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 \
--build-arg HTTP_PROXY=http://172.16.10.29:8080/ \
--build-arg HTTPS_PROXY=http://172.16.10.29:8080/ \
--build-arg NO_PROXY=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 \
-t pva2008/k8sphp:latest .
                """
                 sh "ssh jenkins@192.168.65.210 sudo -E docker push pva2008/k8sphp:latest"
                



            }
        }
        stage('4-Clean') {
            steps {
                echo "---------------------------------------------------"
                //sh "ssh jenkins@192.168.65.210 rm Dockerfile index.php "
                sh "ssh jenkins@192.168.65.210  ls -a "
                sh "exit"
            }
        }
        // stage('4-Clean') {
        //     steps {
        //         echo "Clean"
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