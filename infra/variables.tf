variable candidate_name {
    description = "Mitt kandidatnummer"
    type = string
    default = "kandidat2006"
}

variable service_name {
    description = "Navnet på servicen, endre dette hvis du vil :>"
    type = string
    default = "apprunner"
}

variable policy_name {
    description = "Navnet på policyen du lager"
    type = string
    default = "apprunner-policy"
}

variable image_identifier {
    description = "Link til imaget du vil apprunner skal kjøre"
    type = string
    default = "244530008913.dkr.ecr.eu-west-1.amazonaws.com/kandidat2006-ecr:latest"
}

variable role_name {
    description = "Navnet på rollen som oprettes"
    type = string
    default = "apprunner-rolle"
}

variable port {
    description = "Hvilken port du vil appen skal kjøre på"
    type = number
    default = 8080
}

variable dashboard_name {
    description = "Navnet på dashboardet i cloudwatch"
    type = string
    default = "dashboard"
}

variable alarm_email {
    description = "Hvilken mail du vil sende alarmer til"
    type = string
    default = "bean016@student.kristiania.no"
}