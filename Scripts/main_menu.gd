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
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")


func _on_options_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property($Camera2D, "position", Vector2(0, -180), 2).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_pressed() -> void:
	get_tree().quit()




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
