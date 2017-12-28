podTemplate(label: 'golang-pod',  cloud: 'kubernetes',  nodeSelector: 'kubernetes.io/hostname=192.168.100.88', containers: [
 containerTemplate(
         name: 'golang',
         image: 'harbor.weiboyi.com/build/docker:git',
         ttyEnabled: true,
         command: 'cat'
     ),
 containerTemplate(
         name: 'jnlp',
         image: 'harbor.weiboyi.com/build/jnlp-slave:latest',
         args: '${computer.jnlpmac} ${computer.name}',
         command: ''
     )
]
,volumes: [
     /*persistentVolumeClaim(mountPath: '/home/jenkins', claimName: 'jenkins', readOnly: false),*/
     hostPathVolume(hostPath: '/root/work/jenkins', mountPath: '/home/jenkins'),
     hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
     hostPathVolume(hostPath: '/tmp/', mountPath: '/tmp/'),
]) 
{
 node ('golang-pod') {
     container('golang') {
         git url: 'https://github.com/kissjared/search_api.git' , branch: 'master'
         stage('Build blog project') {
             sh("cd search_api && pwd && ls ")
         }
     }
 }
}
