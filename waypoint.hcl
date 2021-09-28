project = "example"

variable "docker_encoded_auth" {
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
        image        = "docker.io/jgwhite/waypoint-example"
        tag          = "dev"
        local        = false
        encoded_auth = var.docker_encoded_auth
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
