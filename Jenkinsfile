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
		when{
			branch 'master'
		}
			steps{
				script{
					app = docker.build("guruprasadmhl/node-app")
					app.inside{
					sh 'echo $(curl http://34.213.163.2:8081)'
					}
				}
			}
		
		}
	
	}
}
