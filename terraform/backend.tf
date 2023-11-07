terraform {
  backend "gcs" {
    bucket = "tf-state-gcp-demo-proj-326120"
    prefix = "terraform/np"
  }
}