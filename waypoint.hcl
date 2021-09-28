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
    use "docker" {
      disable_entrypoint = true
    }
    registry {
      use "docker" {
        image    = "docker.io/jgwhite/waypoint-example"
        tag      = "dev"
        local    = false
        username = var.docker_username
        password = var.docker_password
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
