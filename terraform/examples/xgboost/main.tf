provider "aws" {
  region = local.region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", local.eks_cluster]
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", local.eks_cluster]
    }
  }
}

data "aws_eks_cluster" "this" {
  name = local.eks_cluster
}

locals {
  region      = var.region
  name        = "xgboost"
  eks_cluster = "eks-ray-cluster"
}

module "xgboost_cluster" {
  source = "../../modules/ray-cluster"

  namespace        = local.name
  ray_cluster_name = local.name
  eks_cluster_name = local.eks_cluster

  helm_values = [
    yamlencode({
      image = {
        repository = "rayproject/ray-ml"
        tag        = "2.0.0"
        pullPolicy = "IfNotPresent"
      }
      head = {
        enableInTreeAutoscaling = "True"
        resources = {
          limits = {
            cpu               = "4"
            memory            = "4Gi"
            ephemeral-storage = "20Gi"
          }
          requests = {
            cpu               = "4"
            memory            = "4Gi"
            ephemeral-storage = "20Gi"
          }
        }
        tolerations = [
          {
            key      = local.name
            effect   = "NoSchedule"
            operator = "Exists"
          }
        ]
        containerEnv = [
          {
            name  = "RAY_LOG_TO_STDERR"
            value = "1"
          }
        ]
      }
      worker = {
        resources = {
          limits = {
            cpu               = "2"
            memory            = "4Gi"
            ephemeral-storage = "20Gi"
          }
          requests = {
            cpu               = "2"
            memory            = "4Gi"
            ephemeral-storage = "20Gi"
          }
        }
        tolerations = [
          {
            key      = local.name
            effect   = "NoSchedule"
            operator = "Exists"
          }
        ]
        replicas    = "0"
        minReplicas = "0"
        maxReplicas = "4"
        containerEnv = [
          {
            name  = "RAY_LOG_TO_STDERR"
            value = "1"
          }
        ]
      }
    })
  ]
}