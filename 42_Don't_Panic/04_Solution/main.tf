# Example terraform code for using the HTTP data source
# HTTP data sources work with SSL, but do not support authentication
# Make sure you own or trust the server you're getting data from.

data "http" "iceandfire" {
  url = "https://anapioficeandfire.com/api/characters/583"

  # Optional request headers
  request_headers = {
    "Accept" = "application/json"
  }
}

locals {
  json_data = jsondecode(data.http.iceandfire.body)
}

resource "null_resource" "quote" {
  provisioner "local-exec" {
    command = "echo You know nothing, ${local.json_data.name}!"
  }
}

output "quote" {
  value = "You know nothing, ${local.json_data.name}!"
}
