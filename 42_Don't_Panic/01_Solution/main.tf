variable "warning_message" {
  default = "This is a restricted system. Authorized users only."
}

resource "local_file" "login_banner" {
    content = templatefile("banner.tpl", { warning = var.warning_message })
    filename = "/etc/motd"
}