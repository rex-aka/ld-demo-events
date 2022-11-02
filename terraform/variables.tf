# LaunchDarkly Variables
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

# AWS Variables
variable "region" {
  type = string
  description = "AWS Region of choice for deployments."
  default = "eu-west-1"
}

variable "domain_name" {
  type = string
  description = "Demo domain name to use."
}

variable "domain_zoneid" {
  type = string
  description = "Demo domain zone ID to use."
}