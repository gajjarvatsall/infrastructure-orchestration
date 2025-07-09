resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.12.0"
  namespace  = "default"

  set {
    name  = "controller.replicaCount"
    value = "1"
  } 
}
