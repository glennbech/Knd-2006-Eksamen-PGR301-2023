variable service_name {
    description = "Navnet på servicen, endre dette hvis du vil :>"
    type = string
    default = "kandidat2006-apprunner"
}

variable policy_name {
    description = "Navnet på policyen du lager"
    type = string
    default = "kandidat2006-apprunner-policy"
}

variable image_identifier {
    description = "Link til imaget du vil apprunner skal kjøre"
    type = string
}

variable aws_access_key {
    description = "Din aws Access key"
    type = string
}

variable aws_secret_key {
    description = "Din aws Secret key"
    type = string
}