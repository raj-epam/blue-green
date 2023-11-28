def ipaddr1 = "10.0.0.5"
pipeline {
    agent any
    stages {
        stage('Modify HTML') {
            steps { 
                sh "sed -i 's/BUILDID/$BUILD_NUMBER/g' index.html"
            }
        }
        stage('Deploy_Server1') {
            steps {
                
                // sh 'ls -laR target'
                sh "chmod +x -R ${env.WORKSPACE}"
                // az network lb address-pool address remove -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress
                // az network lb address-pool address add -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress --vnet MyVnet --ip-address 10.0.0.1
                withCredentials([sshUserPrivateKey(credentialsId: "tomcat", keyFileVariable: 'KEYFILE')]) {
                    sh 'ssh -i $KEYFILE dhluser@10.0.0.5 uname -a'
                    sh './jenkins/scripts/deliver.sh $KEYFILE $BUILD_NUMBER 10.0.0.5'
                    sh './jenkins/scripts/copy.sh $KEYFILE 10.0.0.5'
                }
        }

            }
        
            stage('Approval') {

        steps {
            script {
                def deploymentDelay = input id: 'Deploy', message: 'Sanity Test Success?', submitter: 'dhluser,admin', parameters: [choice(choices: ['0', '1', '2', '3'], description: 'MINUTES to delay deployment?', name: 'deploymentDelay')]
                sleep time: deploymentDelay.toInteger(), unit: 'MINUTES'
            }
        }
    }

        stage('Deploy_Server2') {
            steps {
                
                // sh 'ls -laR target'
                sh "chmod +x -R ${env.WORKSPACE}"
                // az network lb address-pool address remove -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress
                // az network lb address-pool address add -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress --vnet MyVnet --ip-address 10.0.0.1
                withCredentials([sshUserPrivateKey(credentialsId: "tomcat", keyFileVariable: 'KEYFILE')]) {
                    sh 'ssh -o StrictHostKeyChecking=no -i  $KEYFILE dhluser@10.0.0.6 uname -a'
                    sh './jenkins/scripts/deliver.sh $KEYFILE $BUILD_NUMBER 10.0.0.6'
                    sh './jenkins/scripts/copy.sh $KEYFILE 10.0.0.6'
                }
        }

            }
        }
    }

