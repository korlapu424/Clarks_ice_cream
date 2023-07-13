output "cic_vpc_id_ot" {
  value = aws_vpc.vpc_clarks_ice_cream.id
}

output "CIC_main_rt_ot" {
  value = aws_vpc.vpc_clarks_ice_cream.main_route_table_id
}

output "CIC_second_rt_ot" {
  value = aws_route_table.CIC_second_rt.id
}

output "CIC_gw_ot" {
  value = aws_internet_gateway.CIC_gw.id
}

#output "cic_subnet_ids" {
#  value = "${data.aws_subnet.cic_subnet.*.id}"
#}