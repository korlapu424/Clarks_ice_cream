output "ec2_instance_public_ip" {
    value = aws_instance.cic_host.public_ip
}

output "ec2_instance_public_dns" {
    value = aws_instance.cic_host.public_dns
}