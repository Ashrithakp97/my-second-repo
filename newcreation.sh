pipeline {
    agent any

    parameters {
        string(name: 'ROLE_ID', description: 'Vault Role ID')
        string(name: 'SECRET_ID', description: 'Vault Secret ID')
        string(name: 'SECRET_PATH', description: 'Vault path')
        string(name: 'KEY1', description: 'Key 1')
        string(name: 'VAL1', description: 'Value 1')
        string(name: 'KEY2', description: 'Key 2')
        string(name: 'VAL2', description: 'Value 2')
    }

    environment {
        VAULT_ADDR = "${env.VAULT_ADDR}"
    }

    stages {
        stage('Create Vault Secret') {
            steps {
                sh '''
                    chmod +x createsec.sh
                    ./createsec.sh "$ROLE_ID" "$SECRET_ID" "$SECRET_PATH" "$KEY1" "$VAL1" "$KEY2" "$VAL2"
                '''
            }
        }
    }
}

