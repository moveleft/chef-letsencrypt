pipeline {
  agent any
  stages {
    stage('error') {
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
        input(message: 'a', id: 'u', ok: 'oeau', submitter: 'submitter', submitterParameter: 'param')
      }
    }
  }
}