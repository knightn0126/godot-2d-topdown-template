extends StateEntity
class_name StatePlayerInput

@export var walls_detector: RayCast3D

var input_dir: Vector2

func update(_delta):
	input_dir = Input.get_vector("left", "right", "up", "down")
	entity.is_running = entity.is_moving and Input.get_action_strength("run") > 0

func physics_update(_delta):
	_handle_inputs()

func _handle_inputs():
	if Input.is_action_just_pressed("jump"):
		entity.jump()
	# if Input.is_action_just_pressed("attack") and not entity.is_damaged:
	# 	entity.is_charging = true
	# if Input.is_action_just_released("attack") and entity.is_charging:
	# 	entity.is_charging = false
	if Input.is_action_just_pressed("attack"):
		entity.attack()
	entity.move(input_dir)
