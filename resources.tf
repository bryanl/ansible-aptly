variable "domain" {}
variable "host" {}

resource "digitalocean_droplet" "aptly" {
  image = "ubuntu-14-04-x64"
  name = "${var.host}.${var.domain}"
  region = "${var.region}"
  size = "2gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_record" "default" {
  domain = "${var.domain}"
  type = "A"
  name = "${var.host}"
  value = "${digitalocean_droplet.aptly.ipv4_address}"
}

