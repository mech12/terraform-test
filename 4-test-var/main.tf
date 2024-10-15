
resource "local_file" "foo" {
  content  = <<-EOF
              #!/bin/bash
              echo "My Web Server - var test" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  filename = "foo.bar"
}


output "server_port" {
  value       = var.server_port
  description = "The server_port of the Instance"
}
