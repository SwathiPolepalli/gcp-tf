# Plan Triggers
resource "google_cloudbuild_trigger" "<internal-any-name>" {
  project     = var.project_id
  name        = "<trigger-name>"
  description = "<purpose of this trigger>"source_to_build {
    uri       = "https://github.com/<company-name>/<repo-name>"
    ref       = "refs/heads/master"
    repo_type = "GITHUB"
  }
  git_file_source {
    path      = "path/to/cloudbuild.yaml"
    uri       = "https://github.com/<company-name>/<repo-name>"
    revision  = "refs/heads/master"
    repo_type = "GITHUB"
  }
}

# Apply Triggers
resource "google_cloudbuild_trigger" "tools-tf-apply-trigger" {
  name        = "tools-terraform-apply"
  description = "Tools Terraform Apply"
  filename    = "cloud-build/tf-apply-project.yaml"
  project     = var.project_id

  substitutions = {
    _BACKEND_CONFIG_BUCKET = format("bucket=tf-state-%s", var.project_id)
    _BACKEND_CONFIG_PREFIX = format("prefix=terraform/%s", var.env)
    _DIR                   = "."
    _TF_COMMAND            = "apply"
    _TF_OPTIONS            = "-auto-approve"
    _VAR_FILE              = format("%s.tfvars", var.env_tag)
  }

  github {
    owner = "telus"
    name  = local.github_repo
    push {
      tag = format("orbit-%s.[v*]", var.env_tag)
    }
  }
}
