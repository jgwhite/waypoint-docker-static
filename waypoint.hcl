project = "example"

app "web" {
  build {
    use "docker" {}
    registry {
      use "docker" {
        image = "jgwhite/waypoint-example"
        tag   = "latest"
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
