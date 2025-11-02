extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ClickSound.pitch_scale = randf_range(2.0,4.0)


func _on_level_one_pressed() -> void:
	
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")




func _on_level_one_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($Levels/LevelOne, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)

func _on_level_one_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($Levels/LevelOne, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
