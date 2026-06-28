##########################################################
# Google Cloud Project Variables
##########################################################

variable "project_id" {
  description = "Google Cloud Project ID where Terraform will create resources."

  type = string

  default = "vishnu-cloud-lab"
}

##########################################################
# Google Cloud Region
##########################################################

variable "region" {
  description = "Default Google Cloud region."

  type = string

  default = "asia-south1"
}

##########################################################
# Google Cloud Zone
##########################################################

variable "zone" {
  description = "Default Google Cloud zone."

  type = string

  default = "asia-south1-a"
}