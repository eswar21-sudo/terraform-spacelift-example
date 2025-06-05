terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}
provider "spacelift" {
  api_key    = var.spacelift_api_key
  api_secret = var.spacelift_api_secret
}


resource "spacelift_stack" "example-stack" {
  name = var.new_stack_name
  space_id          = "01HXYZABC123ABC456"

  #administrative    = true
  autodeploy        = false
  branch            = "master"
  description       = "Shared production infrastructure (networking, k8s)"
  repository        = "testing-spacelift"
  terraform_version = "0.12.27"
}

resource "spacelift_webhook" "simple-webhook-4" {
  stack_id = spacelift_stack.example-stack.id

  endpoint = "https://example.com/example_webhook"
  secret   = "my_secret"
}
