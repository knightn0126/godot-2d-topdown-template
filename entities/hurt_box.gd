@tool
extends Area2D
class_name HurtBox

@export var health_controller: HealthController

func _init() -> void:
	monitorable = false
	monitoring = true
	collision_layer = 0
	z_index = -1

func _ready() -> void:
	area_entered.connect(_on_hitbox_entered)

func _on_hitbox_entered(hitbox: HitBox):
	if !hitbox or !health_controller:
		return
	health_controller.change_hp(hitbox.change_hp, hitbox.owner.name)
