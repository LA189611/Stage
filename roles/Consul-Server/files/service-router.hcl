  Kind = "service-router"
  Name = "api"
  Routes = [
    {
      Match {
        HTTP {
          Header = [
            {
              Name  = "x-debug"
              Exact = "1"
            },
          ]
        }
      }
      Destination {
        Service       = "api"
        ServiceSubset = "v2"
      }
    }
  ]