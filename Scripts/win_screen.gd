extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	position = Vector2(8,166)
	tween.tween_property(self, "position", Vector2(8,-40.5), 1).set_trans(Tween.TRANS_BACK)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ClickSound.pitch_scale = randf_range(2.0,4.0)


func _on_restart_button_pressed() -> void:
	
	$ClickSound.play()
	await $ClickSound.finished
	
	get_parent().emit_signal("restart_pressed")


func _on_main_menu_button_pressed() -> void:
	
	$ClickSound.play()
	await $ClickSound.finished
	
	get_parent().emit_signal("main_menu_pressed")


func _on_restart_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($RestartButton, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)


func _on_restart_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($RestartButton, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)


func _on_main_menu_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($MainMenuButton, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)


func _on_main_menu_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($MainMenuButton, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
