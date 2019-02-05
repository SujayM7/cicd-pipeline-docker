pipeline {
    agent any
	
    stages{
	stage('Build'){
		steps{
			echo "Running build autoation"
			sh './gradlew build --no -daemon'
			archiveArtifacts artifacts: 'dist/trainSchedule.zip'
			}
		}
	stage('Build Docker Image'){
		steps{
				script{
					app = docker.build("guruprasadmhl/node-app")
					app.inside{
					sh 'echo $(curl http://34.213.163.2:8080)'
					}
				}
			}
	}
		stage('Push Docker Image'){
			steps{
				script{
					docker.withRegistry('https://registry.hub.docker.com','Gurudocker'){
					app.push("${env.BUILD_NUMBER}")
					app.push("latest")
					}
				}
			}
		
		}
	}
}
