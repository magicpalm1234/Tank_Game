extends Node2D

class_name Enemy

@export var explotions: PackedScene

@export var health: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func take_damage(amount):
	health -= amount
	if health <= 0:
		die()


func die():
	var new_explotions = explotions.instantiate()
	add_child(new_explotions)
	new_explotions.emitting = true
	$AnimatedSprite2D.play("Idle")
	await new_explotions.finished
	queue_free()
