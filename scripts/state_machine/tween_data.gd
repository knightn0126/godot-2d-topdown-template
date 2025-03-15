extends Resource
class_name TweenData

@export var curve: Curve = null
@export var duration := 1.0
@export var delay := 0.0
@export var property := ""
@export var end_value := ""
@export var reset_value_at_end := true

var start_value
var target_value
