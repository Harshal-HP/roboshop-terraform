resource "null_resource" "kubeconfig" {
    command = "az aks get-credentials --name=${var.names} --resource-group=${var.rg_name} --overwrite-existing"
}

resource "helm_release" "external-secrets" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  namespace  = "devops"
  create_namespace = true
  set = [
    {
      name  = "installCRDs"
      value = "true"
    }
  ]
}