node{
    stage('SCM CheckOut'){
     echo 'About to GIT Pull source files needed to build and deploy the app'    
     git credentialsId: '51aa63d8-1bdb-492e-a390-af2e482276f3', url: 'https://github.com/jordyjose/WebAppDeployment.git'
    }
    
    stage('Mvn Package'){
     echo 'About to set up Maven'
     sh 'mvn clean package'
      //def mvnHome = tool name: 'Apache Maven 3.6.3', type: 'maven'
      //def mvnCMD  = "${mvnHome}/bin/mvn"
      //sh '${mvnCMD}mvn clean package'
    } 
    
    stage('Build Docker Image'){
     echo 'About to build Docker image'
     sh 'docker build -t jjtho/my-app:2.0.0 .'    
    }
    
    stage('Push Docker Image'){
     echo 'About to build Docker image'
       withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
          sh "docker login -u jjtho -p ${dockerHubPwd}"
       }
       sh 'docker push jjtho/my-app:2.0.0'    
    }
    
    stage('Deploy and Run Container on DevServer'){
     echo 'Running Container on a Dev Server'
        sh 'docker run -p 7070:8080 -d --name jordins_container jjtho/my-app:2.0.0'    
      
    }
}


