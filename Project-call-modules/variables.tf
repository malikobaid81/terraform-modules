variable "region" {
  type        = string
  description = "The AWS region where resources will be created."
  default     = "ap-south-1"
}

variable "project_name" {
  type        = string
  description = "The name of the project, used to identify resources."
  default     = "modules"
}

variable "environment" {
  type        = string
  description = "The environment for deployment (e.g., dev, staging, production)."
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
  type        = string
  description = "The CIDR block for the public subnet in Availability Zone 1."
  default     = "10.0.0.0/24"
}

variable "public_subnet_az2_cidr" {
  type        = string
  description = "The CIDR block for the public subnet in Availability Zone 2."
  default     = "10.0.1.0/24"
}

variable "private_app_subnet_az1_cidr" {
  type        = string
  description = "The CIDR block for the private application subnet in Availability Zone 1."
  default     = "10.0.2.0/24"
}

variable "private_app_subnet_az2_cidr" {
  type        = string
  description = "The CIDR block for the private application subnet in Availability Zone 2."
  default     = "10.0.3.0/24"
}

variable "private_data_subnet_az1_cidr" {
  type        = string
  description = "The CIDR block for the private data subnet in Availability Zone 1."
  default     = "10.0.4.0/24"
}

variable "private_data_subnet_az2_cidr" {
  type        = string
  description = "The CIDR block for the private data subnet in Availability Zone 2."
  default     = "10.0.5.0/24"
}
