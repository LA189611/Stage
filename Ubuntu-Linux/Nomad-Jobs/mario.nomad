job "mario-docker" {
  datacenters = ["mirahi"]
  type = "service"

  group "game" {

    network {
      port "http" {
        static = 80

      }
    }

    service {
      name = "mario"
      connect {
        sidecar_service {}
      }
    }

    task "mario" {
      driver = "docker"

      config {
        image = "pengbai/docker-supermario"
        ports = ["http"]

      }
    }
  }
}