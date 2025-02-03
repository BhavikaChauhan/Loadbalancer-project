output "web_server_1_id" {
  value = aws_instance.web_server_1.id
}

output "web_server_2_id" {
  value = aws_instance.web_server_2.id
}

output "nlb_dns_name" {
  value = aws_lb.nlb.dns_name
}
