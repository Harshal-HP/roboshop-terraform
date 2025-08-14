resource "null_resource" "kubeconfig" {
    depends_on = [ azurerm_kubernetes_cluster.main ]
    
    triggers = {
      time = timestamp()
    }

    provisioner "local-exec" {
        command = <<EOF
        az login --service-principal --username $ARM_CLIENT_ID --password $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID
        az aks get-credentials --name=${var.name} --resource-group=${var.rg_name} --overwrite-existing
        EOF
    }
}

resource "helm_release" "external-secrets" {
  depends_on = [null_resource.kubeconfig]
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

resource "null_resource" "external-secrets-secret-store" {
  depends_on = [helm_release.external-secrets]

  provisioner "local-exec" {
    command = <<TF
cat <<EOF | kubectl apply -f -
apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: roboshop-${var.env}
spec:
  provider:
    vault:
      server: "http://vault-int.harshaldevops.online:8200"
      path: "roboshop-${var.env}"
      version: "v2"
      auth:
        tokenSecretRef:
          name: vault-token
          key: token
          namespace: devops
---
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
  namespace: devops
data:
  token: ${ base64encode( var.token ) }
EOF
TF
  }
}

## ArgoCD
resource "helm_release" "argocd" {
  depends_on = [null_resource.external-secrets-secret-store]
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer"
    }
  ]
}

## Filebeat Helm Chart
resource "helm_release" "filebeat" {

  depends_on = [null_resource.external-secrets-secret-store]
  name       = "filebeat"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
  namespace  = "kube-system"
  wait       = "false"

  values = [
    file("${path.module}/helm-values/filebeat.yml")
  ]
}