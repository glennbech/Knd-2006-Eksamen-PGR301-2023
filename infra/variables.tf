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

variable role_name {
    description = "Navnet på rollen som oprettes"
    type = string
    default = "kandidat2006-apprunner-rolle"
}

variable port {
    description = "Hvilken port du vil appen skal kjoere på"
    type = number
    default = 8080
}