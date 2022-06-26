podTemplate (
    containers: [
        containerTemplate(
                name: 'build-env',
                image: 'alexeysavchuk/build-image',
                command: 'sleep',
                args: '30d'
            )
        ],
        imagePullSecrets: [
            'demo-project-registry'
        ],
        serviceAccount: 'myserviceaccount',
        envVars: [
            envVar(key: 'IMAGE_NAME', value: 'alexeysavchuk/app-image')
        ]
) {
node(POD_LABEL) {
        stage('Build a Maven project') {
            git url: 'https://github.com/alexey-savchuk/demo-project.git', branch: 'main'
            container('build-env') {
                sh 'cd app && npm install'
                sh 'deploy_from_yaml kube/app.yaml'
            }
        }
    }
}
