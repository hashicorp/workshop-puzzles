# Copyright IBM Corp. 2020, 2023
# SPDX-License-Identifier: Apache-2.0

resource "null_resource" "enter-the-matrix" {
  provisioner "local-exec" {
    command = "sudo apt -y install cmatrix"
  }
}