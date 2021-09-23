project = "example"

variable "docker_auth" {
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
        image        = "jgwhite/waypoint-example"
        tag          = "dev"
        encoded_auth = var.docker_auth
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
