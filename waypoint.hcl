project = "example"

variable "docker_username" {
  type    = string
  default = ""
}

variable "docker_password" {
  type    = string
  default = ""
}


runner {
  enabled = true
}

app "web" {
  build {
    use "docker" {}
    registry {
      use "docker" {
        image    = "docker.io/jgwhite/waypoint-example"
        tag      = "dev"
        username = var.docker_username
        password = var.docker_password
        local    = false
      }
    }
  }

  deploy {
    use "kubernetes" {}
  }

  release {
    use "kubernetes" {}
  }
}
