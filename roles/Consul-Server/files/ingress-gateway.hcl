Kind = "ingress-gateway"
    Name = "ig"

    Listeners = [
      {
        Port = 9090
        Protocol = "http"
        Services = [
          {
            Name = "api"
          },
        ]
      }
    ]