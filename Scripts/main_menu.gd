extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	# button animations when spawned
	tween.tween_property($Buttons/PlayButton, "position", Vector2(-151, 3), 0.1).set_trans(Tween.TRANS_BACK)
	
	tween.tween_property($Buttons/OptionsButton, "position", Vector2(-151, 23), 0.1).set_trans(Tween.TRANS_BACK)
	
	tween.tween_property($Buttons/QuitButton, "position", Vector2(-151, 43), 0.1).set_trans(Tween.TRANS_BACK)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ClickSound.pitch_scale = randf_range(2.0,4.0)


func _on_play_button_pressed() -> void:
	
	$ClickSound.play()
	await $ClickSound.finished
	
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")


func _on_options_button_pressed() -> void:
	var tween = create_tween()
	
	$ClickSound.play()
	
	tween.tween_property($Camera2D, "position", Vector2(0, -180), 2).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_pressed() -> void:
	var tween = create_tween()
	
	$ClickSound.play()
	
	tween.tween_property($Camera2D, "zoom", Vector2(8, 8), 7.5).set_trans(Tween.TRANS_BACK) # it works, somehow
	get_child(0).emit_signal("stop_backround_animations") # stops the backround from moving
	$Node2D/Parallax2D.autoscroll = Vector2(0,0)
	$Node2D/Parallax2D2.autoscroll = Vector2(0,0)
	await get_tree().create_timer(1.5).timeout # timer of 1.5 after that the game closes
	get_tree().quit()



# random button animations, and i know that i can optimize this
func _on_play_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/PlayButton, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)
func _on_play_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/PlayButton, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
func _on_options_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/OptionsButton, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)
func _on_options_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/OptionsButton, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
func _on_quit_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/QuitButton, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)
func _on_quit_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($Buttons/QuitButton, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
