extends Node2D

signal stop_backround_animations

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_stop_backround_animations() -> void:
	$Parallax2D3.autoscroll = Vector2(0,0)
	$Parallax2D2.autoscroll = Vector2(0,0)
	$Parallax2D.autoscroll = Vector2(0,0)
