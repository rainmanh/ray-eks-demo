variable "region" {
  description = "Region"
  type        = string
  default     = "eu-west-1"
}

variable "name" {
  description = "Name of the VPC, EKS Cluster and Ray cluster"
  default     = "eks-ray-cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "EKS Cluster version"
  default     = "1.32"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

# variable "secondary_vpc_cidr" {
#   type        = string
#   default     = "100.64.0.0/16"
#   description = "CIDR block for the VPC"
# }
