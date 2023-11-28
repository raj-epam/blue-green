def ipaddr1 = "10.0.0.5"
pipeline {
    agent any
    stages {
        // stage('Modify HTML') {
        //     steps { 
        //         sh "echo ${date}  >> index.html"
        //     }
        // }
        stage('Deliver') {
            steps {
                
                // sh 'ls -laR target'
                sh "chmod +x -R ${env.WORKSPACE}"
                // az network lb address-pool address remove -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress
                // az network lb address-pool address add -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress --vnet MyVnet --ip-address 10.0.0.1
                withCredentials([sshUserPrivateKey(credentialsId: "tomcat", keyFileVariable: 'KEYFILE')]) {
                    sh 'ssh -i $KEYFILE 10.0.0.5 dhluser@10.0.0.5 uname -a'
                    // sh './jenkins/scripts/deliver.sh $KEYFILE $BUILD_NUMBER 10.0.0.5'
                    // sh './jenkins/scripts/copy.sh $KEYFILE 10.0.0.5'
                }
        }

            }
        }
    }

