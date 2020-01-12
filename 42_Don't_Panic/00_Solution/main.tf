resource "null_resource" "enter-the-matrix" {
  provisioner "local-exec" {
    command = "sudo apt -y install cmatrix"
  }
}