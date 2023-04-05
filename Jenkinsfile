pipeline{
    agent any
    environment {
       BACK_SPRING_CONTAINER_NAME="candy_back_spring_container"
       BACK_SPRING_NAME = "candy_back_spring"

       BACK_FLASK_CONTAINER_NAME="candy_back_flask_container"
       BACK_FLASK_NAME = "candy_back_flask"
    }
    stages {
        stage('Clean'){
            steps{
                script {
                    try{
                        sh "docker stop ${BACK_SPRING_CONTAINER_NAME}"
                        sh "docker stop ${BACK_FLASK_CONTAINER_NAME}"
                        sleep 1
                        sh "docker rm ${BACK_SPRING_CONTAINER_NAME}"
                        sh "docker rm ${BACK_FLASK_CONTAINER_NAME}"
                    }catch(e){
                        sh 'exit 0'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script{
                     sh "docker build -t ${BACK_SPRING_NAME} ./BE/candy/."
                     sh "docker build -t ${BACK_FLASK_NAME} ./BE/flaskServer/."
                }
            }
        }
        stage('Deploy'){
            steps {
                   sh "docker run -d --name=${BACK_SPRING_CONTAINER_NAME} -p 8080:8080 -e JAVA_OPTS=-Djasypt.encryptor.password=candy@b105 ${BACK_SPRING_NAME}"
                sh "docker run -d --name=${BACK_FLASK_CONTAINER_NAME} -p 0.0.0.0:90:5000 ${BACK_FLASK_NAME}"
                sh "docker image prune --force"
            }
        }
    }
}
