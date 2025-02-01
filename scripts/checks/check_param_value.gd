class_name CheckParamValue
extends Check

@export var param_name := ""
@export var param_value := ""

func check(on: Node = null) -> bool:
	var param = on.get(param_name)
	print_debug("Param %s == %s" % [param, str_to_var(param_value)])
	return param == str_to_var(param_value)
