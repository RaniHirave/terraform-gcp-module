output region {
    value = google_compute_router_nat.vpc_nat.region
    description = "A region of vpc_nat"
}

output router {
    value = google_compute_router.vpc_router.name
    description = "A router of vpc_nat"
}
