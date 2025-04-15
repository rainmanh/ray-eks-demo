#---------------------------------------------------------------
# Data Sources
#---------------------------------------------------------------

data "aws_availability_zones" "available" {}

# Used for Karpenter Helm chart
data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.ecr_public_region
}

