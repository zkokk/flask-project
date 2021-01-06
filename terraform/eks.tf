data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

module "my-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "final-prj-cluster"
  cluster_version = "1.17"
  subnets         = ["subnet-96e43afd", "subnet-2a324d66", "subnet-7cebff06"]
  vpc_id          = "vpc-6dcf7906"

  worker_groups = [
    {
      instance_type = "t2.micro"
      asg_desired_capacity = 2
      asg_min_size = 1
      asg_max_size  = 3
    }
  ]
}
