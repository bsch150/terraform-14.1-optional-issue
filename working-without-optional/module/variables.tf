variable "list_of_objects_var" {
  type = list(object({
    nullable_object = object({
      list_with_optional = list(object({
        attr          = string
        optional_attr = string
      }))
    })
  }))
}
