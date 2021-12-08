pipeline {
  agent {

    docker {
      image 'devcvs-srv01:5000/shop2-backend/jenkins-agent'
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
        sh 'cp -R gateway-api/build/libs/* docker-setup/shop/gateway-api && cd docker-setup/shop/gateway-api && docker build --tag=gateway-api .'
        sh '''docker tag gateway-api mywebapp && docker push devcvs-srv01:5000/shop2-backend/gateway-api:2-staging'''

      }
    }

    stage('Run docker on devbe-srv01') {
      steps {
        sh 'ssh-keyscan -H devbe-srv01 >> ~/.ssh/known_hosts'
        sh '''ssh jenkins@devbe-srv01 << EOF
	sudo docker pull devcvs-srv01:5000/shop2-backend/gateway-api:2-staging
	cd /etc/shop/docker
	sudo docker-compose up -d
EOF'''
      }
    }
  }
  triggers {
    pollSCM('*/1 H * * *')
  }
}