extends Node2D

signal restart_pressed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	$Enemy.rotation_degrees = 2
	tween.tween_property($Enemy, "position", Vector2(176,1), 1)
	await tween.finished
	$Enemy.rotation_degrees = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Buggy.health <= 0:
		lose()



func win():
	pass


func lose():
	var new_lose_screen = preload("res://Scenes/lose_screen.tscn").instantiate()
	add_child(new_lose_screen)
	get_tree().paused = true

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
