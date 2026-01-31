variable "activity_log_subscriptions" {
  description = "List of subscription IDs to send Azure Activity Logs to Sentinel"
  type        = set(string)
}

variable "location" {
  description = "Azure region for Sentinel and DCR resources"
  type        = string
  default     = "westus2"
}

variable "sentinel_rbac_groups" {
  description = "Map of Entra ID group object IDs for Sentinel RBAC"
  type = map(string)
}

variable "mssp_tenant_id" {
  description = "Tenant ID of the MSSP"
  type        = string
}

variable "mssp_principal_id" {
  description = "Group Object ID of MSSP security group (from MSSP tenant)"
  type        = string
}

variable "lighthouse_offer_name" {
  description = "Friendly name for Lighthouse offer"
  type        = string
  default     = "Sentinel MSSP Access"
}