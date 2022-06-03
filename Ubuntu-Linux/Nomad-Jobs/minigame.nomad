job "mini-game" {
  datacenters = ["mirahi"]
  type = "service"
  group "game" {
    network {
      mode ="bridge"
      port "http" {
        static = 80
      }
    }
    service {
      name = "mini-game"
      connect {
        sidecar_service {}
      }
    }  
    task "mini-game" {
      driver = "docker"
      config {
        image = "lscr.io/linuxserver/emulatorjs:latest"
        ports = ["http"]
      }
    }
  }
}
