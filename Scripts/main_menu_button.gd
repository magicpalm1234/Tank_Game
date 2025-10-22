extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.75, 0.75), 0.2).set_trans(Tween.TRANS_BACK)


func _on_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.5, 0.5), 0.2).set_trans(Tween.TRANS_BACK)
