resource "kubernetes_deployment" "app" {
  metadata {
    name = "devsecops-demo"
    labels = {
      app = "devsecops-demo"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "devsecops-demo"
      }
    }

    template {
      metadata {
        labels = {
          app = "devsecops-demo"
        }
      }

      spec {
        container {
          name  = "devsecops-demo"
          image = "trevorgray1985/devsecops-demo:latest"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "devsecops-demo"
  }

  spec {
    selector = {
      app = kubernetes_deployment.app.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}
