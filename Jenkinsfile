pipeline{
    agent any
    environment {
       BACK_CONTAINER_NAME="candy_back_container"
       BACK_NAME = "candy_back"
    }
    stages {
        stage('Clean'){
            steps{
                script {
                    try{
                        sh "docker stop ${BACK_CONTAINER_NAME}"
                        sleep 1
                        sh "docker rm ${BACK_CONTAINER_NAME}"
                    }catch(e){
                        sh 'exit 0'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script{
                     sh "docker build -t ${BACK_NAME} ./BE/candy/."
                }
            }
        }
        stage('Deploy'){
            steps {
                sh "docker run -d --name=${BACK_CONTAINER_NAME} -p 8080:8080 -e JAVA_OPTS=-Djasypt.encryptor.password=candy@b105 ${BACK_NAME}"
                sh "docker image prune --force"
            }
        }
    }
}
