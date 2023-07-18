terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:lts-jdk11"
  keep_locally = false
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.image_id
  name  = var.container_name

  volumes {
    container_path  = "/var/jenkins_home"
    host_path = "/home/josh/terraform_test/jenkins_home"
    volume_name = docker_volume.jenkins_volume.name
  }

  ports {
    internal = 8080
    external = 8080
  }

  ports {
    internal = 50000
    external = 50000
  }
}

resource "docker_volume" "jenkins_volume" {
  name = "jenkins_volume"
}
