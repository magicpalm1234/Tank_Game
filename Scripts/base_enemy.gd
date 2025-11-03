extends CharacterBody2D

class_name Enemy

@export var health: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func take_damage(amount):
	health -= amount
	if health <= 0:
		die()
	



func die():
	remove_from_group("enemy")
	get_parent().emit_signal("enemy_died", self)
	queue_free()
