module "mysql" {
  source                  = "git::ssh://git@github.com/<org>/tf-module-gcp-nw-cloudsql-mysql?ref=v0.0.1"
  name                    = var.db_server_name
  db_name                 = var.db_name
  project_id              = var.project_id
  region                  = var.region_na1
  zone                    = var.tools_zone
  tier                    = var.db_instance_tier
  disk_size               = var.disk_size
  disk_autoresize         = var.disk_autoresize
  database_version        = var.db_version
  maintenance_window_day  = var.maintenance_window_day
  maintenance_window_hour = var.maintenance_window_hour
  ip_configuration        = var.ip_configuration
  backup_configuration    = var.backup_configuration
}
