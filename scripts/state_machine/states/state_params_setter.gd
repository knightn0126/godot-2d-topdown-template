## A state that automatically sets properties on a target node when entering or exiting.  
## Properties can be set directly on a specified node or through a parameter key in the StateMachine.
class_name StateParamsSetter
extends State

@export_category("Set Properties")

## The node on which properties will be set.  
## If assigned, this takes priority over `param_key`.
@export var node: Node:
	set(value):
		node = value

## The key to retrieve a target node from the StateMachine's parameters.  
@export var param_key: String:
	set(value):
		param_key = value

## Properties to set on the target node when entering the state.  
## The dictionary keys represent property names, and the values are the values to assign.
@export var on_enter: Dictionary[String, Variant]

## Properties to set on the target node when exiting the state.  
## The dictionary keys represent property names, and the values are the values to assign.
@export var on_exit: Dictionary[String, Variant]

func enter():
	var set_params_on = _get_node()
	if not set_params_on:
		return
	for prop in on_enter:
		set_params_on.set.call_deferred(prop, on_enter[prop])
	complete()

func exit():
	var set_params_on = _get_node()
	if not set_params_on:
		return
	for prop in on_exit:
		set_params_on.set.call_deferred(prop, on_exit[prop])

## Retrieves the node to apply property changes to.  
## Returns `node` if set, otherwise attempts to find it using `param_key` in the StateMachine.  
func _get_node():
	var set_params_on = null
	if node:
		set_params_on = node
	elif state_machine.params.has(param_key):
		set_params_on = state_machine.params[param_key]
	else:
		push_warning("Node '%s' not found in %s" % [param_key, get_path()])
	return set_params_on
