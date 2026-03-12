# Example IRSA role for Kubernetes service account integration
# REMINDER: Review IAM policy for least privilege
module "irsa_example" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  create_role = true
  role_name   = "example-irsa-role"
  provider_url = module.eks.oidc_provider
  oidc_fully_qualified_subjects = [
    "system:serviceaccount:<YOUR-NAMESPACE>:<YOUR-SA-NAME>"
  ]
  # TODO: Attach policies as needed
}
