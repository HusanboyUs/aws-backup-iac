resource "digitalocean_droplet" "tf-mywebsite-do-droplet" {
    image = local.image
    name = local.name
    region = local.do-region
    size = local.size # i use very very cheapest one haha
    tags = [ "husanverse-me-droplet" ]
}

resource "digitalocean_domain" "tf-mywebsite-do-domain" {
    name = var.website_domain
}

resource "digitalocean_record" "root" {
    domain = digitalocean_domain.tf-mywebsite-do-domain.id
    type = "A"
    name = "@"
    value = digitalocean_droplet.tf-mywebsite-do-droplet.ipv4_address
    ttl = 3600
}

resource "digitalocean_record" "www" {
    domain = digitalocean_domain.tf-mywebsite-do-domain.id
    type = "A"
    name = "www"
    value = digitalocean_droplet.tf-mywebsite-do-droplet.ipv4_address
    ttl = 3600
}

resource "digitalocean_record" "ns1" {
    domain = digitalocean_domain.tf-mywebsite-do-domain.id
    type = "NS"
    name = "@"
    value = "ns1.digitalocean.com."
    ttl = 1800
}

resource "digitalocean_record" "ns2" {
    domain = digitalocean_domain.tf-mywebsite-do-domain.id
    type = "NS"
    name   = "@"
    value = "ns2.digitalocean.com."
    ttl = 1800
}

resource "digitalocean_record" "ns3" {
    domain = digitalocean_domain.tf-mywebsite-do-domain.id
    type = "NS"
    name   = "@"
    value = "ns3.digitalocean.com."
    ttl = 1800
}

resource "digitalocean_project" "tf-my-digitalocean-project" {
    name = "personal-website"
    description = "A project for my personal website in digitalocean"
    purpose = "Web Application"
    environment = local.environment
    resources = [ digitalocean_droplet.tf-mywebsite-do-droplet.urn, 
                  digitalocean_domain.tf-mywebsite-do-domain.urn 
                ]
}