resource "aws_route53_zone" "hyeok_xyz" {
   name = "hyeok.xyz"
}
resource "aws_route53_record" "web" {
   zone_id = aws_route53_zone.hyeok_xyz.zone_id
   name = "www.hyeok.xyz"
   type = "A"
   ttl = "300"
   records = ["alb_DNS"]
}
