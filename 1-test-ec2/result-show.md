(base) roy@roy-MacBook-Pro--stayge test-ec2 % terraform show 
# aws_instance.example:
resource "aws_instance" "example" {
    ami                                  = "ami-0d081196e3df05f4d"
    arn                                  = "arn:aws:ec2:us-west-2:719362073945:instance/i-09dd65c3a5aed88fc"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    host_id                              = null
    iam_instance_profile                 = null
    id                                   = "i-09dd65c3a5aed88fc"
    instance_initiated_shutdown_behavior = "stop"
    instance_lifecycle                   = null
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = null
    monitoring                           = false
    outpost_arn                          = null
    password_data                        = null
    placement_group                      = null
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-044e387af436cf048"
    private_dns                          = "ip-172-31-22-13.us-west-2.compute.internal"
    private_ip                           = "172.31.22.13"
    public_dns                           = "ec2-54-149-222-128.us-west-2.compute.amazonaws.com"
    public_ip                            = "54.149.222.128"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    spot_instance_request_id             = null
    subnet_id                            = "subnet-0786685a2191f98a2"
    tags_all                             = {}
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0e8ef71632976bff1",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        amd_sev_snp      = null
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_protocol_ipv6          = "disabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 3000
        kms_key_id            = null
        tags                  = {}
        tags_all              = {}
        throughput            = 125
        volume_id             = "vol-0ea91850b0a75e405"
        volume_size           = 8
        volume_type           = "gp3"
    }
}