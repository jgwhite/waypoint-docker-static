project = "example"

variable "docker_username" {
  type    = string
  default = ""
}

variable "docker_password" {
  type    = string
  default = ""
}

app "web" {
  build {
    use "docker" {}
    registry {
      use "docker" {
        image    = "jgwhite/waypoint-example"
        tag      = "dev"
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
