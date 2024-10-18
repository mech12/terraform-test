# variable "fruits" {
#   type        = set(string)
#   default     = ["apple", "banana"]
#   description = "fruit example"
# }

# provider "aws" {
#   region = "us-east-2"
# }

# resource "aws_s3_bucket" "mys3bucket" {
#   for_each = toset([for fruit in var.fruits : fruit])
#   bucket   = "akbun-t101study-${each.key}"
# }

variable "fruits" {
  type        = set(string)
  default     = ["apple", "banana"]
  description = "fruit example"
}

variable "postfix" {
  type        = string
  default     = "test"
  description = "postfix"
}


provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "mys3bucket" {
  for_each = toset([for fruit in var.fruits : format("%s-%s", fruit, var.postfix)])
  bucket   = "akbun-t101study-${each.key}"
}
