resource "aws_key_pair" "ssh_key" {

  key_name   = local.key_name
  public_key = file("${local.key_path}")

}

module "security_group" {

  source = "terraform-aws-modules/security-group/aws"

  name        = local.security_group_name
  description = local.security_group_description
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = local.security_group_ingress_cidr_blocks
  ingress_rules       = local.security_group_ingress_rules
  egress_rules        = local.security_group_egress_rules

  ingress_with_cidr_blocks = local.security_group_custom_ingress_rules

}

module "ec2" {

  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = { for name in local.instance_names : name => name }

  availability_zone      = local.aws_subregion
  ami                    = local.image_id
  instance_type          = local.ec2_instance_type
  key_name               = resource.aws_key_pair.ssh_key.key_name
  monitoring             = local.ec2_monitoring_status
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = local.vpc_subnets[0]

  root_block_device = [{

    device_name = local.volume_device_name
    volume_size = local.volume_size

  }]

  tags = {

    Name        = "K8S-Cluster"
    Terraform   = "true"
    Environment = local.env

  }

}

