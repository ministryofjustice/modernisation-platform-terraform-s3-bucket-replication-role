variable "buckets" {
  type        = list(any)
  description = "A list of bucket ARNs to allow access to"
}

variable "replication_bucket" {
  type        = string
  description = "Name of bucket used for replication - if not specified then * will be used in the policy"
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "Tags to apply to resources, where applicable"
  default     = {}
}

variable "suffix_name" {
  type        = string
  default     = ""
  description = "Suffix for role and policy names"
}
