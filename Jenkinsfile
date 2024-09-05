pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/LitJay/hotelBookingSystem.git'
            }
        }
        stage('Build') {
            steps {
                        sh 'gradle clean build'
                        sh 'gradle copyResources'
            }
        }
        stage('Test') {
            steps {
                        bat 'gradle test'
                        
                        script {
                            try {
                                sh 'gradle sonarqube'
                            } catch (Exception e) {
                                echo "SonarQube analysis failed or is not available. Skipping..."
                            }
                        }
            }
        }
        stage('Deploy') {
            steps {                
                        sh 'docker build -t java-app .'
                        sh 'docker run -d --name java-app-container java-app' 
                        sh 'docker logs java-app-container > deployment.log'   
                 }           
        }
    
}

post {
        always {
            // Cleanup or other post-build steps
            echo 'Cleaning up...'
            sh 'docker rm -f java-app-container || echo "No container to remove"'
            sh 'docker rmi -f java-app || echo "No image to remove"' 
        }
        success {
            echo 'Build succeeded!!'
            // You could add notification steps here, e.g., send an email
        }
        failure {
            echo 'Build failed!!'
            // You could add notification steps here, e.g., send an email or Slack message
        }
    }
    }


