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

