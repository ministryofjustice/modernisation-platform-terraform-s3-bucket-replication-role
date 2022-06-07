output "role" {
  value       = aws_iam_role.default
  description = "Direct aws_iam_role resource with all attributes"
}

output "policy" {
  value       = aws_iam_policy.default
  description = "Direct aws_iam_policy resource with all attributes"
}