resource "google_pubsub_topic" "namespace-created" {
  name    = "namespace-created"
  project = "gcp-demo-proj-326120"
  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"
}