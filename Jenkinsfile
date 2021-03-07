pipeline{
    agent any
    tools { 
        maven 'Maven3.6.3' 
    }
   stages{
       stage('Checkout'){
          steps{
           checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/anant338/DevOps-Demo-WebApp.git']]])
          }
       }
       
       stage('Build') {
           steps {
              sh 'mvn compile -f pom.xml'
           }
       }
        stage('Send Build Info:Jira') {
            steps {
                jiraSendBuildInfo branch: 'DEV-1', site: 'anant338.atlassian.net'
                jiraComment body: 'Jenkins Pipeline Build Completed', issueKey: 'DEV-1'
            }
        }
      stage('Code Analysis') {
             steps {
               withSonarQubeEnv(credentialsId: 'SonarQube', installationName: 'SonarQube') {
               sh "${tool("SonarQube")}/bin/sonar-scanner \
                -Dsonar.projectKey=. \
                -Dsonar.sources=. \
                -Dsonar.tests=. \
                -Dsonar.inclusions=**/test/java/servlet/createpage_junit.java \
                -Dsonar.test.exclusions=**/test/java/servlet/createpage_junit.java \
                -Dsonar.login=admin \
                -Dsonar.password=sonar "
                 sh 'mvn validate -f pom.xml'
                }
             }
        }
       
       stage('Deploy to Artifactory') {
           steps {
               rtMavenResolver (
                 id: 'resolver-unique-id',
                 serverId: 'Artifactory',
                 releaseRepo: 'libs-release',
                 snapshotRepo: 'libs-snapshot'
                                )  
 
                rtMavenDeployer (
                  id: 'deployer-unique-id',
                  serverId: 'Artifactory',
                  releaseRepo: 'libs-release-local',
                  snapshotRepo: 'libs-snapshot-local',
                  threads: 6
                 )
                 rtMavenRun (
                        // Tool name from Jenkins configuration.
                            pom: 'pom.xml',
                            goals: 'package',
                       // Maven options.
                            opts: '-Xms1024m -Xmx4096m',
                            resolverId: 'resolver-unique-id',
                            deployerId: 'deployer-unique-id',
                     // If the build name and build number are not set here, the current job name and number will be used:
                            buildName: JOB_NAME ,
                            buildNumber: BUILD_NUMBER
                          )
               
               
               rtPublishBuildInfo (
                      serverId: 'Artifactory'
                                 )
           }
       }
       
      // stage('Deploy to test') {
      //     steps {
      //         sh 'mvn package -f pom.xml' 
     //          deploy adapters: [tomcat8(credentialsId: 'b4bf869a-9319-45d6-9989-edff703d9a1e', path: '', url: 'http://18.217.2.193:8080')], contextPath: '/QAWebapp', onFailure: false, war: '**/*.war'
               
     //        }
     //  }
     stage('Docker Build and Publish') {
           steps {
                sh 'mvn package -f pom.xml' 
                withDockerRegistry([ credentialsId: "Docker", url: "" ]) {
                sh 'docker build -t webapp:latest .' 
                sh 'docker tag webapp anant338/webapp:latest'
                sh  'docker push anant338/webapp:latest'
            } 
          }
        }
     
       // stage('Publish image to Docker Hub') {
          
       //     steps {
       //           withDockerRegistry([ credentialsId: "Docker", url: "" ]) {
       //          sh  'docker push anant338/webapp:latest'
                  
       //           }
                  
       //         }
       //      }
        stage('Run Docker container on Test Server') {
             
            steps {
                script {
                try {
              sh "docker -H ssh://root@172.31.39.220 run -d -p 8081:8080 anant338/webapp"
                } catch(Error) {
                    
                }
                }
             
            }
        }
       stage('UI Test and Notification') {
           parallel {
              stage('UI Test') {
                 steps {
                 sh 'mvn test -f functionaltest/pom.xml'   
                 publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '\\functionaltest\\target\\surefire-reports', reportFiles: 'index.html', reportName: 'UI Test', reportTitles: ''])
                 }
              }
       
           //  stage('Performance Test') {
           //        steps {
           //             blazeMeterTest credentialsId: 'Blazemeter', testId: '9141486.taurus', workspaceId: '786908'
           //        }
           //     }
                stage('Slack Notification') {
                   steps {
                       slackSend channel: 'alerts', message: 'Deploy to Test was successful.'  
                   }
                }
           }
       }
       
     //   stage('Deploy to PROD') {
     //   steps {
     //         sh 'mvn clean install -f pom.xml' 
     //          deploy adapters: [tomcat8(credentialsId: 'b4bf869a-9319-45d6-9989-edff703d9a1e', path: '', url: 'http://3.141.167.144:8080')], contextPath: '/ProdWebapp', war: '**/*.war'
     //      }
     //  }
     stage('Run Docker container on PROD Server') {
             
            steps {
                script {
                try {
              sh "docker -H ssh://root@172.31.43.100 run -d -p 8081:8080 anant338/webapp"
                } catch(error) {
                    
                }
                }
            }
        }
    stage('Sanity test and Notification') {
      parallel {
           stage('Sanity Test') {
               steps {
                  sh 'mvn test -f Acceptancetest/pom.xml'   
                  publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '\\Acceptancetest\\target\\surefire-reports', reportFiles: 'index.html', reportName: 'Sanity Test Report', reportTitles: ''])
               }
           }
           stage('Slack Notification') {
               steps {
                 slackSend channel: 'alerts', message: 'Deploy to PROD was successful.'  
               }
           }
           
       }
    }
    stage('Send Deployment Info:Jira') {
                steps {
                    jiraSendDeploymentInfo environmentId: 'PROD', environmentName: '"Production', environmentType: 'production', issueKeys: ['DEV-1'], serviceIds: [''], site: 'anant338.atlassian.net', state: 'successful'
                    jiraComment body: 'Jenkins Pipeline Completed', issueKey: 'DEV-1'
                    
                }
            }
            stage('Deploy to K8') {
          steps {
              sshagent(['Kubernetes']){
             //sh "scp -o StrictHostKeyChecking=no Deployment.yaml ubuntu@172.31.46.190:/home/ubuntu/" 
               sh "scp -o StrictHostKeyChecking=no Deployment.yaml root@172.31.22.75:/home/ubuntu/" 
             script
             {
             try {
              //sh "ssh ubuntu@172.31.46.190 kubectl apply -f ."
                sh "ssh root@172.31.22.75 kubectl apply -f ."
             } catch(error) {
              //sh "ssh ubuntu@172.31.46.190 kubectl create -f ." 
                sh "ssh root@172.31.22.75 kubectl create -f ."
               }
             }
            } 
          }
      }
      }
  }
