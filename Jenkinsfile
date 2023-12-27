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
                sh "scp -r ./chart-vasili  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./index.php  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./Dockerfile  jenkins@192.168.65.210:/home/jenkins"
                sh "scp ./dockerbuild.sh ./loadbalancer.sh  jenkins@192.168.65.210:/home/jenkins"
                sh "ssh jenkins@192.168.65.210 sudo chmod +x ./dockerbuild.sh ./loadbalancer.sh"
                sh "ssh jenkins@192.168.65.210 sudo chown jenkins ./dockerbuild.sh ./loadbalancer.sh"
                echo "-----------------------Prepare-End----------------------------"

            }
        }
        stage('2-Docker-Build') {
            steps {
                echo "-----------------------Docker-Build----------------------------"
                 sh "ssh jenkins@192.168.65.210  ./dockerbuild.sh"
                echo "-----------------------Docker-End----------------------------"
            }
        }
        stage('3-Deploy') {
            steps {
                echo "-----------------------Deploy----------------------------"
                sh "ssh jenkins@192.168.65.210 helm install app  ./chart-vasili"
                sh "ssh jenkins@192.168.65.210  ./loadbalancer.sh"
                //  sh ("""
                //  ssh jenkins@192.168.65.210 kubectl patch svc app-service -n default -p '{"spec": {"type": "LoadBalancer", "externalIPs":["192.168.65.205"]}}'
                //  """)
 
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

	
    }
}