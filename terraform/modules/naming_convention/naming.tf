variable name {
    type = string
}

variable "detailed_name" {
  type = bool
}

variable "append" {
  type = string
}

output name {
    value = var.detailed_name ? format("%s-%s",var.name,var.append) : var.name
}
