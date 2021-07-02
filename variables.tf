variable "buckets" {
  type        = list(any)
  description = "A list of bucket ARNs to allow access to"
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
