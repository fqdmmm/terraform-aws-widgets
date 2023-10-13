terraform {
  cloud {
    organization = "example-org-b29b7c"

    workspaces {
      name = "ACME_Corp_Widgets"
    }
  }
}