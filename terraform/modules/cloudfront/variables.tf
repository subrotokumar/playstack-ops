variable "bucket" {
  type = object({
    id = string
    arn = string
    regional_domain_name = string
  })
}