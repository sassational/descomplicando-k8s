locals {

  aws_region    = "us-east-1"
  aws_subregion = "us-east-1a"

  security_group_name                = "k8s-cluster"
  security_group_description         = "Security Group for K8S Nodes"
  security_group_ingress_cidr_blocks = ["0.0.0.0/0"]
  security_group_ingress_rules       = ["kubernetes-api-tcp", "ssh-tcp"]
  security_group_egress_rules        = ["all-all"]
  security_group_custom_ingress_rules = [
    {
      from_port   = 10250
      to_port     = 10259
      protocol    = "tcp"
      description = "Kubelet Ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      description = "NodePort Ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 2379
      to_port     = 2380
      protocol    = "tcp"
      description = "ETCD Ports"
      cidr_blocks = "0.0.0.0/0"
  }]

  image_id              = "ami-04a81a99f5ec58529"
  ec2_instance_type     = "t2.micro"
  ec2_key_name          = "k8s-node"
  ec2_monitoring_status = false
  instance_names        = ["control-plane", "worker-1", "worker-2"]

  vpc_id      = "vpc-0282643a72e97a10d"
  vpc_subnets = ["subnet-006a22ffdcf9b6471", "subnet-07e1c97302109d4fa", "subnet-0b17eead87f7b3c95", "subnet-04f33b2d439fbb6fa", "subnet-0619774dc018df64b", "subnet-042c80b3638c4401c"]

  volume_device_name = "/dev/sda1"
  volume_size        = "20"

  env = "development"

  key_name = "k8s-cluster-ssh-key"
  key_path = "~/.ssh/k8s_cluster.pub"

}
