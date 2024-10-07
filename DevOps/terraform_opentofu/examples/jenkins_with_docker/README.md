# Jenkins with Docker
[Jenkins Docker Docs](https://github.com/jenkinsci/docker/blob/master/README.md)

## Setup
1. Copy all of the files from this folder into your new folder
2. Start the container with `terraform apply`
3. Navigate to http://localhost:8080 in your browser
4. Print out the Jenkins password
    ```
    $ docker exec ExampleJenkinsContainer cat /var/jenkins_home/secrets/initialAdminPassword
    1a77f83cdf1044f1ab85f29183a2396a
    ```
5. Copy the password and paste it into the UI then press "Continue"
6. Click "Install suggested plugins"
7. Create a username/password
8. 
