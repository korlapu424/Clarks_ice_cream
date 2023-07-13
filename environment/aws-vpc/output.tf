output "cic_vpc_id" {
    value = module.vpc-module-cic.cic_vpc_id_ot
    
  
}

output "CIC_main_rt_ot" {
  value = module.vpc-module-cic.CIC_main_rt_ot
}

output "CIC_second_rt_ot" {
  value = module.vpc-module-cic.CIC_second_rt_ot
}

output "CIC_gw_ot" {
  value = module.vpc-module-cic.CIC_gw_ot
}

#output "cic_ec2_sg" {
#  value = module.sp-module-cic.Sg_id
#}

#output "ec2_instance_public_ip" {
#    value = module.cic_ec2-instance.ec2_instance_public_dns
#}

#output "ec2_instance_public_dns" {
#    value = module.cic_ec2-instance.ec2_instance_public_ip
#}



#output "subnet_id" {
#  value = module.vpc-module-cic.cic_subnet_ids
#}