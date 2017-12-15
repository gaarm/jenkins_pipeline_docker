node {
    def image

    stage('Checkout') {
        checkout scm
    }

    stage('Build image') {
        /* Builds the image using Dockerfile */
        image = docker.build('gpeapp')
    }
    
    stage('Stoping already running container') {
        try {
            sh 'docker stop my-running-app'
            sh 'docker rm my-running-app'
        } catch (error) {
            echo "Could not stop docker container. Appereantly not running. Continuing ..."
        }
    }
    
    stage('Start new container') {
        sh 'docker run -d -p 81:80 --name my-running-app gpeapp'
    }
}