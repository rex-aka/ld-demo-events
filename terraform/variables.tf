variable "name" {
  type = string
  description = "Name of the person who will run the demo."
}

variable "project" {
  type = string
  description = "Name of the project/event."
}

variable "ld_access_token" {
  type = string
  description = "API key with write access."
}

variable "header_text" {
  type = string
  description = "The event name or group to welcome."
  default = "Gartner IT Symposium/Xpo 2022"
}