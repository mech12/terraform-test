```bash
(base) roy@roy-MacBook-Pro--stayge test-ec2 % terraform destroy
aws_instance.example: Refreshing state... [id=i-09dd65c3a5aed88fc]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.example will be destroyed
  - resource "aws_instance" "example" {
      - ami                                  = "ami-0d081196e3df05f4d" -> null
      - arn                                  = "arn:aws:ec2:us-west-2:719362073945:instance/i-09dd65c3a5aed88fc" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-west-2b" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-09dd65c3a5aed88fc" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-044e387af436cf048" -> null
      - private_dns                          = "ip-172-31-22-13.us-west-2.compute.internal" -> null
      - private_ip                           = "172.31.22.13" -> null
      - public_dns                           = "ec2-54-149-222-128.us-west-2.compute.amazonaws.com" -> null
      - public_ip                            = "54.149.222.128" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [
          - "default",
        ] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0786685a2191f98a2" -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0e8ef71632976bff1",
        ] -> null
        # (8 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-0ea91850b0a75e405" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
            # (1 unchanged attribute hidden)
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.example: Destroying... [id=i-09dd65c3a5aed88fc]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 10s elapsed]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 20s elapsed]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 30s elapsed]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 40s elapsed]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 50s elapsed]
aws_instance.example: Still destroying... [id=i-09dd65c3a5aed88fc, 1m0s elapsed]
aws_instance.example: Destruction complete after 1m2s

Destroy complete! Resources: 1 destroyed.
```