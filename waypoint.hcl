project = "docker-static"

# Labels can be specified for organizational purposes.
# labels = { "foo" = "bar" }

app "web" {
  build {
    use "docker" {}
    registry {
      use "docker" {
        image = "docker-static"
        tag   = "1"
        local = true
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
    }
  }

  release {
    use "kubernetes" {}
  }
}
