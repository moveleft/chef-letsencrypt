pipeline {
  agent any
  stages {
    stage('') {
      steps {
        parallel(
          "B1": {
            echo 'a'
            
          },
          "B2": {
            echo 'a'
            
          },
          "B3": {
            sh 'echo a'
            
          },
          "B4": {
            echo 'e'
            
          }
        )
      }
    }
    stage('C1') {
      steps {
        echo 'a'
      }
    }
  }
}