extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	position = Vector2(8.0,166)
	tween.tween_property(self, "position", Vector2(8.0,-40.5), 1).set_trans(Tween.TRANS_BACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
