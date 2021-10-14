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
      buildkit = true
    }

    registry {
      use "docker" {
        image    = "jgwhite/waypoint-example"
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
    use "kubernetes" {
      ingress "http" {
        annotations = {
          "kubernetes.io/ingress.class" = "nginx"
          "cert-manager.io/issuer"      = "letsencrypt-prod"
        }
        host = "smallwins.club"
        tls {
          hosts       = ["smallwins.club"]
          secret_name = "smallwins-club-tls"
        }
      }
    }
  }
}
