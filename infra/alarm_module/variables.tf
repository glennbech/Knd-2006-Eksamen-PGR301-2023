variable "threshold" {
  description = "Antall bilder du vil alarmen skal gå ved"
  default = "20"
  type = string
}

variable "alarm_email" {
  description = "Mail du vil sende varselet til"
  type = string
}

variable "prefix" {
  description = "Navn / kandidatnavn"
  type = string
}

variable "comparison_operator" {
  description = "Om thresholdet skal være høyere, lavere, eller lik."
  type = string
  default = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  type = string
  default = "2"
}

variable "period" {
  type = string
  default = "60"
}

variable "statistic" {
  type = string
  default = "Maximum"
}

variable "metric_name"{
  description = "Hvilken metric du vil alarmen skal gå etter"
  type = string
  default = "image_count.value"
}


