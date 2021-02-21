# get EKS cluster info to configure Kubernetes provider
data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

# get EKS authentication for being able to manage k8s objects from terraform
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
 # load_config_file       = false
}

module "my-cluster" {
  source           = "terraform-aws-modules/eks/aws"
  cluster_name     = "my-cluster"
  cluster_version  = "1.17"

  subnets          = module.vpc.private_subnets 
  vpc_id           = module.vpc.vpc_id
  
  write_kubeconfig = false
  #wheter to write Kubectl config file containing the cluster configuration
  
worker_groups = [
    {
      instance_type = "t2.micro"
      asg_desired_capacity = 2
      asg_max_size  = 3
      asg_min_size  = 1
      root_volume_type = "gp2"
    }
  ]
}
