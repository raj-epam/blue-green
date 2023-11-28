def IP_ADDRESS1 = "10.0.0.5"
pipeline {
    agent any
    stages {
        stage('Modify HTML') {
            steps { 
                sh "echo \"<h1>$(date)</h1><br>This pipeline got executed at above time</body> </html>\"  >> index.html"
            }
        }
        stage('Deliver') {
            steps {
                // sh 'ls -laR target'
                sh "chmod +x -R ${env.WORKSPACE}"
                // az network lb address-pool address remove -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress
                // az network lb address-pool address add -g MyResourceGroup --lb-name MyLb --pool-name MyAddressPool -n MyAddress --vnet MyVnet --ip-address 10.0.0.1
                
                

                withCredentials([sshUserPrivateKey(credentialsId: "tomcat", keyFileVariable: 'KEYFILE')]) {
                    sh 'ssh -i $KEYFILE ${IP_ADDRESS1} dhluser@${IP_ADDRESS1} uname -a'
                    sh './jenkins/scripts/deliver.sh $KEYFILE $BUILD_NUMBER ${IP_ADDRESS1}'
                    sh './jenkins/scripts/copy.sh $KEYFILE ${IP_ADDRESS1}'
                }
        }

            }
        }
    }

