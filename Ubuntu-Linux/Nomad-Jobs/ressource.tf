resource "nomad_job" "nyancat" {
  jobspec = file("${path.module}/nyancat.nomad")
}

resource "nomad_job" "mini-game" {
  jobspec = file("${path.module}/minigame.nomad")
}