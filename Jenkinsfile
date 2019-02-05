pipeline {
    agent any
    stages{
	stage('Build'){
		steps{
			echo "Running build autoation",
			sh './gradlew build --no -daemon'
			arcgiveArtifacts artifacts: 'dist/trainSchedule.zip'
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
					sh "echo $(curl http://34.213.163.2:8080)'
					}
			}
		}
	stage('Push Docker Image'){
		when{
			branch 'master'
			}
			steps{
				script{
					docker.withRegistry('https://registry.hub.docjer.com','docker_hub_login'){
					app.push("$(env.BUILD_NUMBER")
					app.push("latest")
					}
				}
			}
	}

}
