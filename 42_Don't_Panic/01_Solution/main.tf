resource "random_integer" "d6" {
  min = 1
  max = 6
  seed = 3
}

provisioner "local-exec" {
  command = <<EOT
    echo "Your roll is: ${random_integer.d6}"
  EOT
}