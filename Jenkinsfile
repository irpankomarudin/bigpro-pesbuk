env.DOCKER_REGISTRY = 'irpank'
env.DOCKER_IMAGE_NAME = 'pesbuk-app'
pipeline {
    agent any
    stages {
        stage('docker build') {
            steps {
                sh "docker build --build-arg APP_NAME=$DOCKER_IMAGE_NAME -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER ."
                }
           }
        stage('Docker push') {
            steps {                
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
        stage('tagging') {
            steps {
                sh('sed -i "s/tag/$BUILD_NUMBER/g" deployment-pesbuk.yml')
                }
           }
        //stage('locate namespace') {
            //steps {
              //sh('sed -i "s/default/production/g" deployment-pesbuk.yml')
                //}
           //}
        //stage('add domain') {
            //steps {
                //sh('sed -i "s/pesbuk.komarudins.online/pesbuk-cilsy.komarudins.online/g" deployment-pesbuk.yml')
                //}
           //}
        stage('deploy') {
            steps {
                sh('kubectl delete -f deployment-pesbuk.yml')
                //sh('kubectl apply -f deployment-pesbuk.yml')
                //sh('kubectl apply -f secret-pesbuk.yml')
                }
           }
        //stage('apply-secret') {
            //steps {
                //sh('kubectl apply -f secret-pesbuk.yml')
                //}
           //}
        stage('remove image docker') {
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
         stage('show ingress') {
            steps {
                sh('kubectl get ingress -n=default')
                }
           }        
      }
}
