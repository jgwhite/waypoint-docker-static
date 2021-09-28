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
      buildkit = true
      platform = "linux/arm64"
    }
    registry {
      use "docker" {
        image = "jgwhite/waypoint-example"
        tag   = "dev"
        local = true
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
