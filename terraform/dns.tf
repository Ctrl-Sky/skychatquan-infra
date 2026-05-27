# Create root record
# Points record to elastic IP
resource "cloudflare_dns_record" "root" {
    zone_id = "${var.cloudflare_zone_id}"
    name    = "@" # Means the root domain itself
    content = aws_eip.web.public_ip
    type    = "A"
    proxied = true
    ttl     = 1
    comment = "Root domain pointing to primary server"
}

# Create record for www
# Redirect to skychatquan.com
resource "cloudflare_dns_record" "www" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "www"
  content = "${var.domain_name}"
  type    = "CNAME"
  proxied = true
  ttl     = 1
  comment = "WWW. redirect to ${var.domain_name}"
}
