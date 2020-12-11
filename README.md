# Demo for [this TF issue](https://github.com/hashicorp/terraform/issues/27269) using the new module_variable_optional_attrs experiment

See a trace below. I am able to get this error consistently by running `tf plan` in `./broken-with-optional`.

```
panic: inconsistent list element types (cty.Object(map[string]cty.Type{"nullable_object":cty.Object(map[string]cty.Type{"list_with_optional":cty.List(cty.ObjectWithOptionalAttrs(map[string]cty.Type{"attr":cty.String, "optional_attr":cty.String}, []string{"", "optional_attr"}))})}) then cty.Object(map[string]cty.Type{"nullable_object":cty.Object(map[string]cty.Type{"list_with_optional":cty.List(cty.Object(map[string]cty.Type{"attr":cty.String, "optional_attr":cty.String}))})}))

goroutine 67 [running]:
github.com/zclconf/go-cty/cty.ListVal(0xc00033d500, 0x2, 0x2, 0xc000724990, 0x1, 0x1, 0x1)
	/go/pkg/mod/github.com/zclconf/go-cty@v1.7.0/cty/value_init.go:166 +0x445
github.com/zclconf/go-cty/cty/convert.conversionTupleToList.func2(0x384f040, 0xc0003662a0, 0x2f25420, 0xc0003662c0, 0x0, 0x0, 0x0, 0xc000780000, 0x10, 0x10, ...)
	/go/pkg/mod/github.com/zclconf/go-cty@v1.7.0/cty/convert/conversion_collection.go:327 +0x794
github.com/zclconf/go-cty/cty/convert.getConversion.func1(0x384f040, 0xc0003662a0, 0x2f25420, 0xc0003662c0, 0x0, 0x0, 0x0, 0xc00036a300, 0xc000724980, 0x384ef40, ...)
	/go/pkg/mod/github.com/zclconf/go-cty@v1.7.0/cty/convert/conversion.go:46 +0x433
github.com/zclconf/go-cty/cty/convert.retConversion.func1(0x384f040, 0xc0003662a0, 0x2f25420, 0xc0003662c0, 0xc000724980, 0xc0004a37a0, 0x0, 0x1, 0xc0008f6340, 0x10000c000157000)
	/go/pkg/mod/github.com/zclconf/go-cty@v1.7.0/cty/convert/conversion.go:188 +0x6b
github.com/zclconf/go-cty/cty/convert.Convert(0x384f040, 0xc0003662a0, 0x2f25420, 0xc0003662c0, 0x384ef40, 0xc00084b2f0, 0xc0003662a0, 0x2f25420, 0xc0003662c0, 0x0, ...)
	/go/pkg/mod/github.com/zclconf/go-cty@v1.7.0/cty/convert/public.go:51 +0x1aa
github.com/hashicorp/terraform/terraform.(*nodeModuleVariable).EvalModuleCallArgument(0xc00018dd40, 0x388a660, 0xc000364d00, 0xc000056901, 0x0, 0x2, 0x28)
	/home/circleci/project/project/terraform/node_module_variable.go:238 +0x265
github.com/hashicorp/terraform/terraform.(*nodeModuleVariable).Execute(0xc00018dd40, 0x388a660, 0xc000364d00, 0x4937204, 0x0, 0x0)
	/home/circleci/project/project/terraform/node_module_variable.go:157 +0x7f
github.com/hashicorp/terraform/terraform.(*ContextGraphWalker).Execute(0xc000364000, 0x388a660, 0xc000364d00, 0x2cd68838, 0xc00018dd40, 0x0, 0x0, 0x0)
	/home/circleci/project/project/terraform/graph_walk_context.go:127 +0xbc
github.com/hashicorp/terraform/terraform.(*Graph).walk.func1(0x31f2940, 0xc00018dd40, 0x0, 0x0, 0x0)
	/home/circleci/project/project/terraform/graph.go:59 +0x962
github.com/hashicorp/terraform/dag.(*Walker).walkVertex(0xc00018dda0, 0x31f2940, 0xc00018dd40, 0xc00033d300)
	/home/circleci/project/project/dag/walk.go:387 +0x375
created by github.com/hashicorp/terraform/dag.(*Walker).Update
	/home/circleci/project/project/dag/walk.go:309 +0x1246



!!!!!!!!!!!!!!!!!!!!!!!!!!! TERRAFORM CRASH !!!!!!!!!!!!!!!!!!!!!!!!!!!!
```
