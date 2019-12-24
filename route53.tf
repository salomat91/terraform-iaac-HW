resource "aws_route53_record" "www" { 
  zone_id = "Z3YVBW0Q441HN" 
  name    = "www.salomatkh.com" 
  type    = "A" 
  ttl     = "60" 
  records = [aws_instance.web[0]] 
} 