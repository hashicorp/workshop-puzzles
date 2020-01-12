# This is our six-sided die
resource "random_integer" "d6" {
  min = 1
  max = 6
  # Experiment with different seeds until you get the number you want.
  # seed = 1
}

# A 20 sided die. Don't roll a 1!
resource "random_integer" "d20" {
  min = 1
  max = 20
}

# 20% chance of something....
resource "random_integer" "one-in-five" {
  min = 1
  max = 5
}

# Rolls the d6 and reports the result.
resource "null_resource" "roll-1d6" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Your roll is: ${random_integer.d6.result}"
    EOT
  }
}

# Rolls the d20 and reports the result.
resource "null_resource" "roll-1d20" {
  provisioner "local-exec" {
    command = "echo Your roll is: ${random_integer.d20.result}"
    # Uncomment the below line to rig the dice
    # command = (random_integer.one-in-five.result == 1 ? "echo Your roll is: 20" : "echo Your roll is: ${random_integer.d20.result}")
  }
}
