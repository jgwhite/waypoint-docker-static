project = "acmecorp"

app "web" {
  build {
    use "docker" {}
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
