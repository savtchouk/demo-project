pipeline {
	agent any
	environment{
    	IMAGE_NAME = 'alexeysavchuk/app'
		DOCKERHUB_CREDS = credentials('DockerHub')
  	}
  	stages {
    	stage('configure project') {
      		steps {
        		sh 'cd app && npm install'
      		}
    	}
		stage('build image') {
	     	steps {
		      	sh 'docker build -t $IMAGE_NAME .'
		      	sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
		      	sh 'docker push $IMAGE_NAME'
	      	}
	      	post {
		      	always {
		        	sh 'docker logout'
		      	}
	      	}
	    }
	    stage('deploy application') {
    		steps {
      			sh 'kubectl apply -f kube/app.yaml'
      		}
    	}
  	}
}
