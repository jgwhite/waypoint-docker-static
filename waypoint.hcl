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
    use "docker" {
      disable_entrypoint = true
    }
    registry {
      use "docker" {
        image    = "ghcr.io/jgwhite/waypoint-example"
        tag      = "dev"
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
    use "kubernetes" {}
  }
}
