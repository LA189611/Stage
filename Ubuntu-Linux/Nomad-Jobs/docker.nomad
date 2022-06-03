job "docker" {
  datacenters = ["mirahi"]

  group "Web" {
    network {
      port "http" {}
    }
    task "server" {
      driver = "docker"

      config {
        image = "daviey/nyan-cat-web"
        ports = ["http"]
      }
    }
  }
}
