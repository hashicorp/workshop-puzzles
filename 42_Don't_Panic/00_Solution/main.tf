# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: Apache-2.0

resource "null_resource" "enter-the-matrix" {
  provisioner "local-exec" {
    command = "sudo apt -y install cmatrix"
  }
}