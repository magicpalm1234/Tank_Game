extends CharacterBody2D

var damage := 10

var speed := 100.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.LEFT.rotated(rotation)
	
	velocity = direction * speed
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		pass
