// This defines our entire automated process
pipeline {
    // 'agent any' means this can run on any available Jenkins agent
    agent any

    // 'stages' is the container for all the steps of our pipeline
    stages {
        // First stage: Get the code
        stage('Checkout Source Code') {
            steps {
                // This is a built-in Jenkins step to check out the code from the Git repo we configured in the job
                checkout scm
            }
        }

        // Second stage: Build the Docker image
        stage('Build Docker Image') {
            steps {
                // We run a shell command, first changing into the correct directory
                sh 'cd docker-multistage && docker build -t my-nodejs-app:latest .'
            }
        }

        // Third stage: Run the application
        stage('Deploy Application') {
            steps {
                // We run shell commands to stop and remove any old container with the same name, then run our new one
                // The '|| true' part ensures the command doesn't fail if the container doesn't exist yet
                sh 'docker stop my-app-container || true'
                sh 'docker rm my-app-container || true'
                sh 'docker run -d --name my-app-container -p 3001:3000 my-nodejs-app:latest'
            }
        }
    }
}
