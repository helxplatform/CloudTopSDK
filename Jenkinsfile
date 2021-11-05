pipeline {
    agent {
        kubernetes {
            cloud 'kubernetes'
            yaml '''
              apiVersion: v1
              kind: Pod
              spec:
                containers:
                - name: agent-docker
                  image: helxplatform/agent-docker:latest
                  command:
                  - cat
                  tty: true
                  volumeMounts:
                    - name: dockersock
                      mountPath: "/var/run/docker.sock"
                volumes:
                - name: dockersock
                  hostPath:
                    path: /var/run/docker.sock
            '''
        }
    }
    stages {
        stage('Install') {
            steps {
                container('agent-docker') {
                    sh '''
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                container('agent-docker') {
                    sh '''
                    '''
                }
            }
        }
        stage('Publish') {
            when {
                branch 'master'
            }
            environment {
                DOCKERHUB_CREDS = credentials('rencibuild_dockerhub_machine_user')
            }
            steps {
                container('agent-docker') {
                    sh '''
                    echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin
                    CUR_DIR=$()
                    for app in apps/* ; do
                        cd "$app" || exit
                        make build publish
                        cd ../..
                    done
                    '''
                }
            }
        }
    }
}