terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.29.0"
    }
  }
}

provider "databricks" {
  host = var.workspace_url
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}





data "databricks_current_user" "me" {
} 

resource "databricks_notebook" "tokyo" {
  source = "${path.module}/notebooks/tokyo-olympic.ipynb"
  path   = "${data.databricks_current_user.me.home}/tokyo-olympic"
  format = "JUPYTER"    
}
