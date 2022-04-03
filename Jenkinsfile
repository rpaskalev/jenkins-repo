pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                echo 'Building infrastructure'
                cd terraform
                terraform init
                terraform plan
                '''                
            }
        }
        //
        // stage('Test') {
        //     steps {
        //         echo 'Testing..'
        //     }
        // }
        stage('Deploy') {
            steps {
                sh '''
                echo 'Deploying infrastructure'
                cd terraform
                terraform destroy -auto-approve
                '''
            }
        }
    }
    // post { 
    //     always { 
    //         cleanWs()
    //     }
    // }
}