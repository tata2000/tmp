pipeline {
   agent any
   environment {
       imageName = 'mylitecoin'
       imageVersion='0.18.1'
       currentFullImage="${imageName}:${imageVersion}"
   }
   stages {
       stage('Build') {

           steps {
               sh 'docker build -t ' + currentFullImage + ' .'
           }
       }
       stage ('Deploy') {
           steps {
               script{
                   sh 'kubectl apply -f statefulset.yml'
               }
           }
       }
   }
}

