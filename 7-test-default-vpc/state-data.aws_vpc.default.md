```bash
(base) roy@roy-MacBook-Pro--stayge 7-test-default-vpc % terraform state show data.aws_vpc.default


# data.aws_vpc.default:
data "aws_vpc" "default" {
    arn                                  = "arn:aws:ec2:us-west-2:719362073945:vpc/vpc-05ec5584cb72d67a4"
    cidr_block                           = "172.31.0.0/16"
    cidr_block_associations              = [
        {
            association_id = "vpc-cidr-assoc-09ed1f08517beca61"
            cidr_block     = "172.31.0.0/16"
            state          = "associated"
        },
    ]
    default                              = true
    dhcp_options_id                      = "dopt-0766b515e5a0c3890"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    id                                   = "vpc-05ec5584cb72d67a4"
    instance_tenancy                     = "default"
    ipv6_association_id                  = null
    ipv6_cidr_block                      = null
    main_route_table_id                  = "rtb-0bf2a2730aa5fe1cb"
    owner_id                             = "719362073945"
    tags                                 = {}
}

```