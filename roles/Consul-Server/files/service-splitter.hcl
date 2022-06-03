Kind = "service-splitter"
  Name = "api"
  Splits = [
    {
      Weight        = 90
      ServiceSubset = "v1"
    },
    {
      Weight        = 10
      ServiceSubset = "v2"
    },
  ]