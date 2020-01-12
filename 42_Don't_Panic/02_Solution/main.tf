# Example terraform code for fetching external data from an API, and making it usable by terraform resources and outputs.

# You can set this variable by using a terraform.tfvars file or exporting the TF_VAR_nasa_api_key variable in your shell.
variable "nasa_api_key" {
  description = "Get your free NASA API here: https://api.nasa.gov/"
}

# Your external program needs to speak JSON. JSON inputs come from the query, and the expected result should also be JSON.
data "external" "nasa" {
  program = ["bash", "mars_weather.sh"]

  query = {
    api_key = "${var.nasa_api_key}"
  }
}

# We're using a null resource here but you can use the external data anywhere in your Terraform.
resource "null_resource" "weather_report" {
  provisioner "local-exec" {
    command = <<EOT
      echo "The low temperature at Elysium Plantia is: ${data.external.nasa.result.min_temp_f}"
      echo "The high temperature at Elysium Plantia is: ${data.external.nasa.result.max_temp_f}"
    EOT
  }
}

# Output the values we got from the external API.
output "min_temp_f" {
  value = "Elysium Plantia low temp: ${data.external.nasa.result.min_temp_f}°F"
}
output "max_temp_f" {
  value = "Elysium Plantia high temp: ${data.external.nasa.result.max_temp_f}°F"
}