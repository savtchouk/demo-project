pipeline {
  agent {
    kubernetes {
      yaml '''
      apiVersion: v1
      kind: Pod
      metadata:
      spec:
        containers:
        - name: node
          image: node
          command:
          - sleep
          args:
          - 30d
          tty: true
        - name: docker
          image: docker
          command:
          - sleep
          args:
          - 30d
          tty: true
          securityContext:
            privileged: true
          volumeMounts:
          - mountPath: /var/run/docker.sock
            name: docker-sock
            readOnly: false
        - name: build-env
          image: alexeysavchuk/pipeline-python
          command:
          - sleep
          args:
          - 30d
          tty: true
        volumes:
        - name: docker-sock
          hostPath:
            path: /var/run/docker.sock
            type: Socket
        serviceAccount: myserviceaccount
      '''
    }
  }
  triggers {
    pollSCM('*/15 * * * *')
  }
  environment {
    IMAGE_NAME = 'alexeysavchuk/app'
    DOCKERHUB_CREDS = credentials('DockerHub')
  }
  stages {
    stage('Configure') {
      steps {
        container(name: 'node', shell: '/bin/bash') {
          sh 'cd app && npm install'
        }
      }
    }
    stage('Build Image') {
      steps {
        container('docker') {
          sh '''
            docker build -t ${IMAGE_NAME} .
            echo $DOCKERHUB_CREDS_PSW | docker login --username $DOCKERHUB_CREDS_USR --password-stdin
            docker push ${IMAGE_NAME}
            docker logout
          '''
        }
      }
    }
    stage('Deploy') {
      steps {
        container(name: 'build-env', shell: '/bin/bash') {
          sh 'apply_deployment_from_yaml kube/app.yaml'
        }
      }
    }
  }
}
