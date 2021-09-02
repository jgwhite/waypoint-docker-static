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
    use "docker" {}
    registry {
      use "docker" {
        image        = "jgwhite/waypoint-example"
        tag          = "latest"
        encoded_auth = var.docker_encoded_auth
      }
    }
  }

  deploy {
    use "kubernetes" {
      image_secret = "waypoint-pull"
    }
  }

  release {
    use "kubernetes" {}
  }
}
