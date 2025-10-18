extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	$Enemy.rotation_degrees = 2
	tween.tween_property($Enemy, "position", Vector2(176,1), 1)
	await tween.finished
	$Enemy.rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
