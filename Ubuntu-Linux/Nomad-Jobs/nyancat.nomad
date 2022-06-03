job "NyanCat" {
  region      = "global"
  datacenters = ["mirahi"]
  type = "service"

  group "game" {

    network {
      mode ="bridge"
      port "http" {
        static = 80
        to     = 80
      } 
    }
    
    service {
      name = "nyancat"
      connect {
        sidecar_service {}
      }
    }

    task "NyanCat" {
      driver = "docker"

      config {
        image = "daviey/nyan-cat-web"
        ports = ["http"]
      }
    }
  }
}
