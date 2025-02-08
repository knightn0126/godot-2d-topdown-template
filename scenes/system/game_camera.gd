@tool
extends Camera2D
## Handle main camera movement and target following.  
class_name GameCamera

@export var target_player_id := 0: ## If set to a value greater than 0, the player with the specified ID will be assigned as the camera target.
	set(value):
		target_player_id = value
		target = null
		notify_property_list_changed()
@export var target: Node2D = null: ## The node to follow.
	set(value):
		target = value
		notify_property_list_changed()
		if is_node_ready() and target:
			print("%s target set to: %s" % [name, target])
			target_set.emit()

signal target_set
signal target_reached

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	_enable_smoothing(false)
	Globals.player_added_to_scene.connect(_try_to_set_player_target)
	target_reached.connect(_init_camera)

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if _is_target_reached():
		target_reached.emit()

func _physics_process(_delta: float) -> void:
	if Engine.is_editor_hint():
		return
	_follow_target()

##internal - When transitioning between levels, the camera will be activated upon completing the transfer.
func _init_camera():
	_enable_smoothing(true)

func _enable_smoothing(value):
	# limit_smoothed = value #BUG: it causes issues.
	position_smoothing_enabled = value

##internal - This is linked to the global signal `player_added_to_scene` and is triggered when a new player joins the level.
func _try_to_set_player_target(_player: PlayerEntity):
	if not target and target_player_id > 0:
		var player: PlayerEntity = _player if _player.player_id == target_player_id else null
		if player:
			await player.ready
			target = player
		
##internal - Manages camera tracking of the assigned target.
func _follow_target():
	if is_instance_valid(target):
		global_position = target.position

func _is_target_reached():
	return global_position.is_equal_approx(target.position)

func _validate_property(property: Dictionary) -> void:
	if property.name == "target":
		if target_player_id > 0:
			property.usage = PROPERTY_USAGE_NONE
	if property.name == "target_player_id":
		if target != null:
			property.usage = PROPERTY_USAGE_NONE
