pipeline {
    agent any
    environment {
      PROJECT_NAME = "Zion"
      OWNER_NAME   = "Vasili Pasmurtsev"
    }

    stages {
        stage('1-Prepare') {
            steps {
                echo "-----------------------Prepare----------------------------"
                // sh "ssh jenkins@192.168.65.210 export http_proxy=http://172.16.10.29:8080/" 
                // sh "ssh jenkins@192.168.65.210 export https_proxy=http://172.16.10.29:8080/"
                // sh "ssh jenkins@192.168.65.210 export no_proxy=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 "
                // sh "ssh jenkins@192.168.65.210 export HTTP_PROXY=http://172.16.10.29:8080/ "
                // sh "ssh jenkins@192.168.65.210 export HTTPS_PROXY=http://172.16.10.29:8080/ "
                // sh "ssh jenkins@192.168.65.210 export NO_PROXY=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 "

                sh "scp -r ./chart-vasili  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./index.php  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./Dockerfile  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./dockerbuild.sh  jenkins@192.168.65.210:/home/jenkins"
                sh "ssh jenkins@192.168.65.210 sudo chmod +x ./dockerbuild.sh"
                sh "ssh jenkins@192.168.65.210 sudo chown jenkins ./dockerbuild.sh"
                echo "-----------------------Prepare-End----------------------------"

            }
        }
        stage('2-Docker-Build') {
            steps {
                echo "-----------------------Docker-Build----------------------------"
                // sh "ssh jenkins@192.168.65.210 sudo -E ./dockerbuild.sh"
                echo "-----------------------Docker-End----------------------------"
            }
        }
        stage('3-Deploy') {
            steps {
                echo "-----------------------Deploy----------------------------"
                 sh "ssh jenkins@192.168.65.210 helm install app  ./chart-vasili"
                 sh "ssh jenkins@192.168.65.210 kubectl patch svc app-service -n default -p '{"spec": {"type": "LoadBalancer", "externalIPs":["192.168.65.205"]}}'"
 
                echo "-----------------------Deploy-End----------------------------"
            }
        }
        stage('4-Clean') {
            steps {
                 echo "-----------------------Clean----------------------------"
                sh "ssh jenkins@192.168.65.210 rm  index.php"
                sh "ssh jenkins@192.168.65.210 rm  Dockerfile"
                sh "ssh jenkins@192.168.65.210 rm  dockerbuild.sh"
                sh "ssh jenkins@192.168.65.210  ls -a "
                sh "ssh jenkins@192.168.65.210  sudo docker rmi pva2008/k8sphp:latest "
                sh "ssh jenkins@192.168.65.210  sudo docker images "
                sh "exit"
                echo "-----------------------Clean-End----------------------------"
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
	
    }
}