terraform {
  required_version = "0.14.2"
}

module "test" {
  source = "./module"
  list_of_objects_var = [
    {
      nullable_object = null
    },
    {
      nullable_object = {
        list_with_optional = [
          {
            attr = "line"
          }
        ]
      }
    }
  ]
}
