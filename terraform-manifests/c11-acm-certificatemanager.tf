# ACM Module - To create and Verify SSL Certificates
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.1.1"  

  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id      = data.aws_route53_zone.mydomain.zone_id 

  subject_alternative_names = [
     # "*.lubuusicloud.com" -> Referencing one DNS NAME
    var.dns_name   # Referencing Multiple DNS NAME
  ]
  tags = local.common_tags
 
  # Validation Method
  validation_method = "DNS"
  wait_for_validation = true    
}

# # Output ACM Certificate ARN
output "this_acm_certificate_arn" {
  description = "The ARN of the certificate"
  #value       = module.acm.this_acm_certificate_arn
  value       = module.acm.acm_certificate_arn
}