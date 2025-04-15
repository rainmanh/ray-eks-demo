#---------------------------------------------------------------
# Locals
#---------------------------------------------------------------

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = var.name
    GithubRepo = "github.com/awslabs/data-on-eks"
  }
}
