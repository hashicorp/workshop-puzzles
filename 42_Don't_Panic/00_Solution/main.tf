resource "null_resource" "enter-the-matrix" {
  provisioner "local-exec" {
    command = "DEBIAN_FRONTEND=noninteractive sudo apt -y install cmatrix"
  }
}