variable "warning_message" {
  default = "This is a restricted system. Authorized users only."
}

resource "local_file" "login_banner" {
    # The VSC terraform plugin might think this line is incorrect...
    content = templatefile("banner.tpl", { warning = var.warning_message })
    filename = "/etc/motd"
}