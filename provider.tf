variable "do_token" {}
variable "ssh_fingerprint" {}
variable "region" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
