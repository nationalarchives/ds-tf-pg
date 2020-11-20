# ------------------------------------------------------------------------------
# general db parameter group module
# ------------------------------------------------------------------------------
resource "aws_db_parameter_group" "parameter_group" {
    name        = var.name
    description = var.description
    family      = var.family

    dynamic parameter {
        for_each = var.parameters

        content {
            name  = parameters.value.name
            value = parameters.value.value
        }
    }

    tags = var.tags
}
