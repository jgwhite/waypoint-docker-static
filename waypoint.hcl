project = "example"

variable "registry_username" {
  type    = string
  default = ""
}

variable "registry_password" {
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
        image    = "jgwhite/waypoint-example"
        tag      = "1"
        local    = false
        username = var.registry_username
        password = var.registry_password
      }
    }
  }

  deploy {
    use "kubernetes" {}
  }

  release {
    use "kubernetes" {
      ingress "http" {
        name = "www.smallwins.club"
      }
    }
  }
}
