extends VirtualJoystick

@export var run_action := "run"
@export var run_deadzone := 0.9

func _update_joystick(touch_position: Vector2) -> void:
	super._update_joystick(touch_position)
	if use_input_actions:
		if output.length_squared() > run_deadzone:
			Input.action_press(run_action)
		else:
			Input.action_release(run_action)
