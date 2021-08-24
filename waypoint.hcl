project = "example"

app "web" {
  build {
    use "docker" {}
  }

  deploy {
    use "kubernetes" {}
  }

  release {
    use "kubernetes" {}
  }
}
