pipeline {
  agent {

    docker {
      image 'cyberstel/app'
    }

  }

  stages {

    stage('Copy source with configs') {
      steps {
        git 'https://github.com/ilyalistratov/boxfuse.git'
      }
    }

    stage('Build jar') {
      steps {
        sh 'mvn package'
      }
    }

    stage('Make docker image') {
      steps {
        sh 'ls'
       // sh 'docker build -t box .'
        sh 'cp /var/lib/jenkins/workspace/deploy_war_in_docker/target/hello-1.0.war cyberstel/app && cd cyberstel/app && docker build -t app .'
     //   sh 'docker tag box cyberstel/app'
      //  sh 'docker box'
      //  sh '''docker tag box cyberstel/box:0.1.0 && docker push cyberstel/box:0.1.0'''

      }
    }

//    stage('Run docker on devbe-srv01') {
//      steps {
//        sh 'ssh-keyscan -H devbe-srv01 >> ~/.ssh/known_hosts'
//        sh '''ssh jenkins@devbe-srv01 << EOF
//	sudo docker pull devcvs-srv01:5000/shop2-backend/gateway-api:2-staging
//	cd /etc/shop/docker
//	sudo docker-compose up -d
// EOF'''
//      }
//    }
  }
  triggers {
    pollSCM('*/1 H * * *')
  }
}
