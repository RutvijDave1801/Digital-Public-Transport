pipeline {
    stages {
        stage('Clean project') {
            steps {
                sh 'flutter clean'
            }
        }

        stage('Update dependencies') {
            steps {
                sh 'flutter packages get'
            }
        }
      
        stage('Run tests on Android') {
            steps {
                lock(resource: 'emulator') {
                    sh '''
                    echo "Creating and booting emulator..."
                    make create_emulator
                    make boot_emulator
                    make wait_for_emulator_ready
                    
                    flutter drive --target=test_driver/login.dart
                    '''
                }
            }
            post {
                  always {
                      sh '''
                        echo "Shutting down and deleting emulator..."
                        make teardown_emulator
                        make delete_emulator
                      ''' 
                  }
            }
        }

        stage('Run tests on iOS') {
            steps {
                script {
                    lock(resource: 'iOS simulator flutter') {
                        sh '''
                        echo "Booting simulator..."
                        make boot_ios_simulator
                        
                        flutter drive --target=test_driver/login.dart
                        '''
                    }
                }
            }
            post {
                always {
                    sh "make teardown_simulator"
                }
            }
        }
    }
    post {
        success {
            script {
                //archive artifacts
            }
        }
    }
}