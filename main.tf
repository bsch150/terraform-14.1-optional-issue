module "test" {
  source                = "./module"
  list_of_objects_var = [
    {
      top_level_list_of_object = [
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
  ]
}
