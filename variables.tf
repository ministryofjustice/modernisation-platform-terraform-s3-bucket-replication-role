variable "buckets" {
  type        = list
  description = "A list of bucket ARNs to allow access to"
}

variable "tags" {
  type        = map
  description = "Tags to apply to resources, where applicable"
}
