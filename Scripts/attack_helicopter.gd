extends CharacterBody2D

@export var explotions: PackedScene
@export var small_bullet: PackedScene

@export var health: float

var tween = create_tween()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var tween = create_tween()
	rotation_degrees = -30
	tween.tween_property(self, "position", Vector2(-100, global_position.y), 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var new_small_bullet = small_bullet.instantiate()
	add_child(new_small_bullet)


func take_damage(amount):
	health -= amount
	if health <= 0:
		die()


func die():
	var new_explotions = explotions.instantiate()
	
	add_sibling(new_explotions)
	new_explotions.emitting = true
	new_explotions.position = position
	queue_free()
	
