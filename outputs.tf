output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.IaC-LB.dns_name
}
